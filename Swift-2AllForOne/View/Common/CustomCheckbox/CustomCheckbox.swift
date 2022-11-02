//
//  CustomCheckbox.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 01-11-22.
//

import Foundation
import UIKit

class CustomCheckbox: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var checkboxView: UIView!
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var checkboxTextView: UITextView!
    
    
    // MARK: - Variables
    public var checkboxFlag: Bool = false
    
    
    // MARK: - Inicialización
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
        let xibView = Bundle.main.loadNibNamed("CustomCheckbox", owner: self, options: nil)![0] as! UIView
        xibView.backgroundColor = UIColor.clear
        xibView.frame = self.bounds
        
        xibView.setBorder(color: .clear, round: .half)
        checkboxView.setBorder(color: UIColor.white, round: .number(5))

        
        addSubview(xibView)
    }
    
    // MARK: - Actions
    @IBAction func checkboxTapped(_ sender: UIButton) {
        if(!checkboxFlag) {
            sender.setBackgroundImage((UIImage(named: "icon.checkbox")?.withRenderingMode(.alwaysTemplate)), for: .normal)
            sender.tintColor = .successColor
            checkboxFlag = true
        } else {
            sender.setBackgroundImage(UIImage(), for: .normal)
            checkboxFlag = false
        }
    }
    
}
