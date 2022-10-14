//
//  ViewController.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 13-10-22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var codeTextField: CustomTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeTextField.titleLabel.text = "Nombre"
        codeTextField.button.isHidden = true
    }
    
}

