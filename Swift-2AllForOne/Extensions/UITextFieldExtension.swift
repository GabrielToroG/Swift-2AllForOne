//
//  UITextFieldExtension.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 13-10-22.
//

import Foundation
import UIKit

extension UITextField {
    /// Fija los bordes con el color ingresado y los redondea si es necesario. Además, establece que el texto inicie 10 puntos más lejos del borde izquierdo
    /// - Parameters:
    ///     - borderWidth: El ancho que tendrá el borde, por defecto esta fijado en 1.0
    ///     - color: El color que tendrá el borde, por defecto viene con bordes invisibles
    ///     - round: Es del tipo RoundType y este puede ser con el redondeo a la mitad, con un redondeo a un número específico o sin redondeo
    func setBorderTF(borderWidth: CGFloat = 1.0, color: UIColor, round: Bool) {
        self.setLeftPaddingPoints(10)
        layer.borderWidth = borderWidth
        layer.borderColor = color.cgColor
        self.tintColor = color
        
        if round {
            layer.masksToBounds = true
            layer.cornerRadius = 10
        }
    }
    
    
    /// Fija una padding a la izquierda dentro del Text Field, para que el texto no este tan apegado al borde
    /// - Parameters:
    ///     - amount: Cantidad del left padding
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    
    /// Fija una padding a la derecha dentro del Text Field, para que el texto no este tan apegado al borde
    /// - Parameters:
    ///     - amount: Cantidad del right padding
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
