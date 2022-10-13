//
//  UIViewExtension.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 13-10-22.
//

import Foundation
import UIKit

enum GradientDirection {
    case vertical
    case horizontal
    case diagonal
}

enum RoundType {
    case half
    case number(CGFloat)
    case none
}

enum SeparatorDirection {
    case top
    case bottom
    case both
}

extension UIView {
    /// Aplica una gradiente a la vista con los colores y la dirección ingresada
    /// - Parameters:
    ///     - colorOne: Primer color de la gradiente
    ///     - colorTwo: Segundo color de la gradiente
    ///     - direction: Es del tipo GradientDirection y esta puede ser de arriba a bajo, de izquierda a derecha o diagonal
    func applyGradient(colorOne: UIColor, colorTwo: UIColor, direction: GradientDirection) {
        let gradient = CAGradientLayer()
        gradient.colors = [colorOne.cgColor, colorTwo.cgColor]
        switch direction {
        case .vertical:
            gradient.locations = [0.0, 1.0]
            gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.frame = self.bounds
            self.layer.insertSublayer(gradient, at: 0)
        case .horizontal:
            gradient.locations = [0.0, 1.0]
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.frame = self.bounds
            self.layer.insertSublayer(gradient, at: 0)
        case .diagonal:
            gradient.locations = [0.0, 1.0]
            gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradient.frame = self.bounds
            self.layer.insertSublayer(gradient, at: 0)
        }
    }
    
    
    /// Establece los bordes a la vista, recibiendo por parámetros la densidad del borde, el color y el tipo de borde.
    /// - Parameters:
    ///     - borderWidth: El ancho que tendrá el borde, por defecto esta fijado en 1.0
    ///     - color: El color que tendrá el borde, por defecto viene con bordes invisibles
    ///     - round: Es del tipo RoundType y este puede ser con el redondeo a la mitad, con un redondeo a un número específico o sin redondeo
    func setBorder(borderWidth: CGFloat = 1.0, color: UIColor, round: RoundType) {
        layer.borderWidth = borderWidth
        layer.borderColor = color.cgColor
        switch round {
        case .half:
            layer.masksToBounds = true
            layer.cornerRadius = frame.height / 2
        case .number(let int):
            layer.masksToBounds = true
            layer.cornerRadius = int
        case .none:
            return
        }
    }
    
    
    /// Agrega un separador, recibiendo por parametros su color y la dirección en donde se encontrará este
    /// - Parameters:
    ///     - color: El color que tendrá el separador, por defecto es gris
    ///     - direction: Es del tipo SeparatorDirection y este puede estar arriba, abajo, o en ambos sentidos
    func addSeparator(color: UIColor = UIColor.gray, direction: SeparatorDirection) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        switch direction {
        case .top:
            border.frame = CGRect(x: 0.0, y: -1, width: self.frame.width, height: 0.5)
        case .bottom:
            border.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 0.5)
        case .both:
            let border2 = CALayer()
            border.frame = CGRect(x: 0.0, y: -1, width: self.frame.width, height: 0.5)
            border2.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 0.5)
            border2.backgroundColor = color.cgColor
            self.layer.addSublayer(border2)
        }
        self.layer.addSublayer(border)
     }
    
    
    /// Agrega sombras a la vista actual
    /// - Parameters:
    ///     - shadowColor: El color que tendrá el triangulo
    ///     - radius: El radio que tendrá la sombra
    func addShadow(shadowColor: UIColor, radius: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = radius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4.0
    }
    
    
    /// Coloca un triangulo adentro de la vista actual, por lo que la vista actual se hace transparente (UIColor.clear)
    /// - Parameters:
    ///     - color: El color que tendrá el triangulo
    func setDownTriangle(color: UIColor){
        self.backgroundColor = UIColor.clear
        let heightWidth = self.frame.size.width
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x:heightWidth/2, y: heightWidth))
        path.addLine(to: CGPoint(x:heightWidth, y:0))
        path.addLine(to: CGPoint(x:0, y:0))

        let shape = CAShapeLayer()
        shape.path = path
        shape.lineWidth = 1.0
        //shape.strokeColor = UIColor.secundaryColor!.cgColor // Color del borde
        shape.fillColor = color.cgColor                     // Color del background

        self.layer.insertSublayer(shape, at: 0)
    }
}
