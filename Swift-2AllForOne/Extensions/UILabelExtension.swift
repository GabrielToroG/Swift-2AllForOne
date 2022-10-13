//
//  UILabelExtension.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 13-10-22.
//

import Foundation
import UIKit

extension UILabel {
    /// Agrega espacio entre las letras de un cadena de caracteres
    /// - Parameters:
    ///     - spacingValue: La cantidad de espaciado que tendrán las letras, por defecto esta fijado en 2.0
    func addInterlineSpacing(spacingValue: CGFloat = 2) {
        guard let textString = text else { return }
        let attributedString = NSMutableAttributedString(string: textString)    // Se crea la "cadena mejorada"
        let paragraphStyle = NSMutableParagraphStyle()                          // Se crea el "estilo del párrafo"
        paragraphStyle.lineSpacing = spacingValue                               // Se establece el espacio recibo por pantalla
                                
        // Se le agregan los atributos a la "cadena mejorada"
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length)
        )
        
        // title.attributedText = attributedString
        attributedText = attributedString
    }
}
