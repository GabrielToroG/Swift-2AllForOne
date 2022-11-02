//
//  PrimaryButton.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 20-10-22.
//

import Foundation
import UIKit


class PrimaryButton: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var button: UIButton!
    
    
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
        let xibView = Bundle.main.loadNibNamed("PrimaryButton", owner: self, options: nil)![0] as! UIView
        xibView.backgroundColor = UIColor.clear
        xibView.frame = self.bounds
        
        xibView.setBorder(color: .clear, round: .half)
        
        addSubview(xibView)
    }
}
