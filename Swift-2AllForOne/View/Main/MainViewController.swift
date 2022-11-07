//
//  MainViewController.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 04-11-22.
//

import UIKit
import FirebaseAuth
import GoogleSignIn


enum ProviderType: String {
    case basic
    case google
}

class MainViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var closeSessionButton: UIButton!
    
    // MARK: - Variables
    var email = ""
    var provider = ProviderType(rawValue: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
        saveDataUser()
    }
    
    fileprivate func saveDataUser() {
        let defaults = UserDefaults.standard
        defaults.set(email, forKey: "email") // Se guarda el valor con la clave "email"
        defaults.set(provider?.rawValue, forKey: "provider") // Se guarda el valor con la clave "provider"
        defaults.synchronize()
    }
    
    
    // MARK: - UI Functions
    fileprivate func loadViews() {
        setInitialInfo()
        setButtons()
    }
    
    fileprivate func setInitialInfo() {
        emailLabel.text = email
        providerLabel.text = provider?.rawValue
    }
    
    fileprivate func setButtons() {
        closeSessionButton.setTitle("Cerrar Sesión", for: .normal)
        closeSessionButton.addTarget(self, action: #selector(closeSessionPressed), for: .touchUpInside)
    }

    
    // MARK: - Actions
    @objc func closeSessionPressed() {
        
        // Al cerrar sesión hay que eliminar los datos del usuario
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "provider")
        defaults.synchronize()
        
        // Switch para desloguear de Firebase
        switch provider {
        case .basic:
            firebaseLogout()
        case  .google:
            GIDSignIn.sharedInstance.signOut()
            firebaseLogout()
        default:
            return
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    fileprivate func firebaseLogout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
