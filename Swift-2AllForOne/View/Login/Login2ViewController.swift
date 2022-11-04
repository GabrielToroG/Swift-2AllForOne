//
//  LoginViewController.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 02-11-22.
//

import UIKit
import FirebaseAuth

class Login2ViewController: UIViewController {
    
    // MARK: - Outlets
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Log In"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let emailField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "Email Address"
        emailField.autocapitalizationType = .none
        emailField.leftViewMode = .always
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor.black.cgColor
        return emailField
    }()
    
    private let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.leftViewMode = .always
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = UIColor.black.cgColor
        return passwordField
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Continue", for: .normal)
        return button
    }()
    
    private let signOutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log Out", for: .normal)
        return button
    }()
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        if FirebaseAuth.Auth.auth().currentUser != nil {
            label.isHidden = true
            button.isHidden = true
            emailField.isHidden = true
            passwordField.isHidden = true
            view.addSubview(signOutButton)
            signOutButton.frame = CGRect(x: 20, y: 150, width: view.frame.size.width - 40, height: 52)
            signOutButton.addTarget(self, action: #selector(logOutTapped), for: .touchUpInside)
        }
    }
    
    /// Para que al mostrar el controlador, este tenga el teclado en el email
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if FirebaseAuth.Auth.auth().currentUser == nil {
            emailField.becomeFirstResponder()
        }
    }
    
    /// Para establecer los frames
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 80)
        
        emailField.frame = CGRect(x: 20,
                                  y: label.frame.origin.y + label.frame.size.height + 10,
                                  width: view.frame.size.width - 40,
                                  height: 50)
        
        passwordField.frame = CGRect(x: 20,
                                     y: emailField.frame.origin.y + emailField.frame.size.height + 10,
                                     width: view.frame.size.width - 40,
                                     height: 50)
        
        button.frame = CGRect(x: 20,
                              y: passwordField.frame.origin.y + passwordField.frame.size.height + 30,
                              width: view.frame.size.width - 40,
                              height: 52)

    }
    
    
    // MARK: - Actions
    @objc private func didTapButton() {
        guard let email = emailField.text, !email.isEmpty else {
            setErrorCustomAlert(title: "Error", subtitle: "Verifique si ingresó correctamente su email")
            return
        }
        
        guard let password = passwordField.text, !password.isEmpty else {
            setErrorCustomAlert(title: "Error", subtitle: "Verifique si ingresó correctamente su contraseña")
            return
        }

        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let strongSelf = self else { return }
            
            // Si el usuario no esta logueado
            guard error == nil else {
                strongSelf.showCreateAccount(email: email, password: password)
                return
            }
            
            print("You have signed in")
            strongSelf.label.isHidden = true
            strongSelf.emailField.isHidden = true
            strongSelf.passwordField.isHidden = true
            strongSelf.button.isHidden = true
            
            strongSelf.emailField.resignFirstResponder()
            strongSelf.passwordField.resignFirstResponder()
        }
    }
    
    
    /// Función que cierra la sesión al apretar el botón Log Out.
    /// Además, vuelve a mostrar todos los componentes que estaban ocultos y al botón de SignOut lo elimina
    @objc private func logOutTapped() {
        do { // Se ocupa try catch porque signOut tiene un throws
            try FirebaseAuth.Auth.auth().signOut()
            label.isHidden = false
            button.isHidden = false
            emailField.isHidden = false
            passwordField.isHidden = false
            
            signOutButton.removeFromSuperview()
        }
        catch {
            print("An error occurred")
        }
    }
    


    
    func showCreateAccount(email: String, password: String) {
        let alert = UIAlertController(title: "Create Account", message: "Would you like to create an account", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Continue",
                                      style: .default,
                                      handler: {_ in
                                        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
                                            guard let strongSelf = self else { return }
                                            
                                            guard error == nil else {
                                                print("Account creation failed")
                                                return
                                            }
                                            
                                            print("You have signed in")
                                            strongSelf.label.isHidden = true
                                            strongSelf.emailField.isHidden = true
                                            strongSelf.passwordField.isHidden = true
                                            strongSelf.button.isHidden = true
                                            strongSelf.emailField.resignFirstResponder()
                                            strongSelf.passwordField.resignFirstResponder()
                                        }
        }))
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: {_ in
        }))
        
        present(alert, animated: true)
    }
}
