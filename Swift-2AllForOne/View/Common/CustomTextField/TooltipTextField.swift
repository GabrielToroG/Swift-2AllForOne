//
//  TooltipTextField.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 14-10-22.
//

import Foundation
import UIKit

/*
    Como ocupar estos botones:
    1. Crear un StackView en el storyboard
    2. Darle las restricciones de los lados y la altura
    3. Agregarle un View adentro con leading/trailing 0 y altura 68
    4. Darle la clase TooltipTextField
    5. Vincular la View al ViewController
    6. En el ViewController customizar las opciones si es necesario:
        label.text,
        textField.addTarget
        textField.isSecureTextEntry
        button.setImage()
*/

class TooltipTextField: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonTextField: UIButton!
    @IBOutlet weak var triangleView: UIView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var tooltipLabel: UILabel!
    
    
    // MARK: - Initialization
    /// Este inicializador es llamado si y solo si es una instancia programada.
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
    }
    
    /// Este inicializador es llamado si y solo si es una instancia del storyboard.
    /// NSCoder -> Traduce todo lo hecho en el storyboard a código
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewInit()
    }
    
    /// Función que añade el XIB con las dimensiones que tiene el contenedor padre a este mismo
    func viewInit() {
        let xibView = Bundle.main.loadNibNamed("TooltipTextField", owner: self, options: nil)![0] as! UIView
        xibView.backgroundColor = UIColor.clear
        xibView.frame = self.bounds
        
        textField.setBorderTF(color: .black, round: true)
        buttonTextField.addTarget(self, action: #selector(showTooltip), for: .touchUpInside)

        circleView.layer.masksToBounds = true
        circleView.layer.cornerRadius = 10
        circleView.isHidden = true
        triangleView.setDownTriangle(color: UIColor.systemGray4)
        triangleView.isHidden = true

        addSubview(xibView)
    }
    
    
    // MARK: - Actions
    /// Función que muestra y esconde el tooltip
    @objc func showTooltip() {
        if circleView.isHidden {
            circleView.isHidden = false
            triangleView.isHidden = false
        } else {
            circleView.isHidden = true
            triangleView.isHidden = true
        }
    }
}
