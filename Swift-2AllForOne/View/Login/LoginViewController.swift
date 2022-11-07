//
//  LoginViewController.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 02-11-22.
//

import UIKit
import FirebaseAuth
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var emailView: PrimaryTextField!
    @IBOutlet weak var passwordView: PrimaryTextField!
    @IBOutlet weak var signUpView: PrimaryButton!
    @IBOutlet weak var logInView: PrimaryButton!
    @IBOutlet weak var googleView: ImageButton!

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
        loadDataUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stackView.isHidden = false
    }
    
    
    // MARK: - UI Functions
    fileprivate func loadViews() {
        setTextFields()
        setButtons()
        setNavBarTitle(title: "Autentificación", color: .black)
    }
    
    fileprivate func setTextFields() {
        emailView.titleLabel.text = "Email"
        emailView.textField.keyboardType = .emailAddress
        emailView.button.isHidden = true
        
        passwordView.titleLabel.text = "Password"
        passwordView.textField.isSecureTextEntry = true
        passwordView.button.setImage(UIImage(named: "icon.visibility.off"), for: .normal)
        passwordView.button.addTarget(self, action: #selector(setSecureTextEntry), for: .touchUpInside)
    }
    
    fileprivate func setButtons() {
        signUpView.button.setTitle("Registrarse", for: .normal)
        signUpView.button.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        
        logInView.button.setTitle("Ingresar", for: .normal)
        logInView.button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        googleView.button.setTitle("Google", for: .normal)
        googleView.button.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
    }
    
    fileprivate func loadDataUser() {
        let defaults = UserDefaults.standard
        if let email = defaults.value(forKey: "email") as? String,
           let provider = defaults.value(forKey: "provider") as? String {
             
            stackView.isHidden = true
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            nextVC.email = email
            nextVC.provider = ProviderType.init(rawValue: provider)
            self.navigationController?.pushViewController(nextVC, animated: false)
        }
    }
    
    
    // MARK: - Actions
    /// Al presionar el botón de Registrarse, se crea el usuario en Firebase:
    /// 1. Se comprueban los campos de texto
    /// 2. Se crea el usuario, si no hay errores se pasa a la siguiente pantalla
    @objc func signupButtonTapped() {
        guard let email = emailView.textField.text, !email.isEmpty else {
            setErrorCustomAlert(title: "Error", subtitle: "Verifique si ingresó correctamente su email")
            return
        }
        guard let password = passwordView.textField.text, !password.isEmpty else {
            setErrorCustomAlert(title: "Error", subtitle: "Verifique si ingresó correctamente su contraseña")
            return
        }
        
        /// Esta función crea al usuario y manda un callback que nos indica si el usuario se registro correctamente
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            self.showMain(result: result, error: error, provider: .basic)
        }
    }
    
    /// Al presionar el botón de Ingresar, se ingresa el usuario en Firebase:
    /// 1. Se comprueban los campos de texto
    /// 2. Se inicia sesión, si no hay errores se pasa a la siguiente pantalla
    @objc func loginButtonTapped() {
        guard let email = emailView.textField.text, !email.isEmpty else {
            setErrorCustomAlert(title: "Error", subtitle: "Verifique si ingresó correctamente su email")
            return
        }
        guard let password = passwordView.textField.text, !password.isEmpty else {
            setErrorCustomAlert(title: "Error", subtitle: "Verifique si ingresó correctamente su contraseña")
            return
        }
        
        /// Esta función ingresa al usuario y manda un callback que nos indica si el usuario ingresó correctamente
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            self.showMain(result: result, error: error, provider: .basic)
        }
    }
    
    /// Al presionar el botón de Google, se crea y se ingresa el usuario en Firebase:
    /// 1. Se presenta el popup de google
    /// 2. Se inicia sesión, si no hay errores se pasa a la siguiente pantalla
    @objc func googleButtonTapped() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Crea el objeto de configuración de Google Sign In.
        let config = GIDConfiguration(clientID: clientID)

        // Inicia el flujo de entrada
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            if let error = error {
                print(error)
                return
            }

            guard let authentication = user?.authentication,
                  let idToken = authentication.idToken else {
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            Auth.auth().signIn(with: credential) { (result, error) in
                self.showMain(result: result, error: error, provider: .google)
            }
        }
    }
    
    /// Función complementaria que recibe el resutado, error y el provider del Auth.auth().signIn().
    /// Si no hay errores se pasa a la siguiente pantalla, mandandole información a esta
    /// Si hay errores se muestran las distintas alertas
    fileprivate func showMain(result: AuthDataResult?, error: Error?, provider: ProviderType) {
        if let result = result, error == nil {
            // Storyboard > MainViewController > Darle un id
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            nextVC.email = result.user.email!
            nextVC.provider = provider
            self.navigationController?.pushViewController(nextVC, animated: true)
        } else {
            let errorCode = (error! as NSError).code
            switch errorCode {
            case 17007:
                self.setErrorCustomAlert(title: "Error", subtitle: "El usuario ya esta registrado")
            case 17008:
                self.setErrorCustomAlert(title: "Error", subtitle: "El email ingresado es inválido")
            default:
                self.setErrorCustomAlert(title: "Error", subtitle: "Se ha producido un error registrando al usuario")
            }
        }
    }
    
    /// Función del botón de la contraseña, el cual muestra o no esta última
    @objc func setSecureTextEntry() {
        if passwordView.button.currentImage! == UIImage(named: "icon.visibility.off") {
            passwordView.textField.isSecureTextEntry = false
            passwordView.button.setImage(UIImage(named: "icon.visibility.on"), for: .normal)
        } else {
            passwordView.textField.isSecureTextEntry = true
            passwordView.button.setImage(UIImage(named: "icon.visibility.off"), for: .normal)
        }
    }
}
