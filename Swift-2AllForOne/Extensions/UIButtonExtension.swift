//
//  UIButtonExtension.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 13-10-22.
//

import Foundation
import UIKit

extension UIButton {
    /// Animación que cambia el color de fondo del botón primario
    func changeColor() {
        let animation = CABasicAnimation(keyPath: "backgroundColor")
//        animation.fromValue = UIColor.secundaryColor?.cgColor
//        animation.toValue = UIColor.secundaryDarkColor?.cgColor
        animation.duration = 0.2
        animation.autoreverses = true
        
        layer.add(animation, forKey: "backgroundColor")
    }
    
    
    /// Animación que cambia el color de fondo del botón secundario
    func changeColorOutline() {
        let animation = CABasicAnimation(keyPath: "backgroundColor")
        animation.fromValue = UIColor.clear.cgColor
//        animation.toValue = UIColor.secundaryColor?.withAlphaComponent(0.5).cgColor
        animation.duration = 0.2
        animation.autoreverses = true
        
        layer.add(animation, forKey: "backgroundColor")
    }
    
    
    /// Animación que cambia la opacidad del boton terciario
    func shine() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0.5
        }) { completion in
            UIView.animate(withDuration: 0.2) {
                self.alpha = 1
            }
        }
    }
   
    
    /// Animación que hace vibrara al botón, ideal para mostrar un rechazo al apretar un botón
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 1
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
    }
}
