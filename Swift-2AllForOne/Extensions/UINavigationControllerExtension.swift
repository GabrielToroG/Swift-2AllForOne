//
//  UINavigationControllerExtension.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 13-10-22.
//

import Foundation
import UIKit

extension UINavigationController {
    
    /// Esconde el border inferior de la navegación
    func hideHairline() {
        if let hairline = findHairlineImageViewUnder(navigationBar) {
            hairline.isHidden = true
        }
    }
    
    /// Muetra el border inferior de la navegación
    func restoreHairline() {
        if let hairline = findHairlineImageViewUnder(navigationBar) {
            hairline.isHidden = false
        }
    }
    
    /// Función complementaría que permite esconder o mostrar el borde inferior de la navegación
    func findHairlineImageViewUnder(_ view: UIView) -> UIImageView? {
        if view is UIImageView && view.bounds.size.height <= 1.0 {
            return view as? UIImageView
        }
        for subview in view.subviews {
            if let imageView = self.findHairlineImageViewUnder(subview) {
                return imageView
            }
        }
        return nil
    }
}
