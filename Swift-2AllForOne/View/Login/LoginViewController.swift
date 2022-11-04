//
//  LoginViewController.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 02-11-22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var emailView: CustomTextField!
    @IBOutlet weak var passwordView: CustomTextField!
    @IBOutlet weak var signUpView: PrimaryButton!
    @IBOutlet weak var logInView: PrimaryButton!

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
    }
    
    // MARK: - UI Functions
    fileprivate func loadViews() {
        setTextFields()
        setButtons()
    }
    
    fileprivate func setTextFields() {
        emailView.titleLabel.text = "Email"
        emailView.button.isHidden = true
        
        passwordView.titleLabel.text = "Password"
        passwordView.textField.isSecureTextEntry = true
        passwordView.button.setImage(UIImage(named: "icon.visibility.off"), for: .normal)
        passwordView.button.addTarget(self, action: #selector(setSecureTextEntry), for: .touchUpInside)
    }
    
    fileprivate func setButtons() {
        signUpView.button.setTitle("Registrarse", for: .normal)
        logInView.button.setTitle("Ingresar", for: .normal)
    }
    
    @objc fileprivate func setSecureTextEntry() {
        if passwordView.button.currentImage! == UIImage(named: "icon.visibility.off") {
            passwordView.textField.isSecureTextEntry = false
            passwordView.button.setImage(UIImage(named: "icon.visibility.on"), for: .normal)
        } else {
            passwordView.textField.isSecureTextEntry = true
            passwordView.button.setImage(UIImage(named: "icon.visibility.off"), for: .normal)
        }
    }
}
