//
//  UIViewControllerExtension.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 13-10-22.
//

import Foundation
import UIKit

extension UIViewController {
    /// Establece el título del header --> Retorna un UIView
    /// - Parameters:
    ///     - title: El título que tendrá el header
    func setNavBarTitle(title: String){
        let titleText = title
        let tLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 160, height: 40))
        tLabel.text = titleText
        tLabel.textColor = UIColor.white
        tLabel.textAlignment = .center
        tLabel.adjustsFontSizeToFitWidth = true
        tLabel.minimumScaleFactor = 0.5
        self.navigationItem.titleView = tLabel
    }
    
    /// Establece el retroceder del header --> Retorna un Custom View
    func setNavBarBackButton(){
        let backImage = UIImage(systemName: "chevron.backward")
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80.0, height: 40.0))
        backButton.setImage(backImage, for: .normal)
        backButton.setTitle(NSLocalizedString("button_back", comment: ""), for: .normal)
        backButton.tintColor = .white
        backButton.titleEdgeInsets = UIEdgeInsets(top: 20.0, left: 5.0, bottom: 20.0, right: 0.0)
        backButton.contentHorizontalAlignment = .left
        backButton.addTarget(self, action: #selector(dismissViewController2), for: UIControl.Event.touchUpInside)
        
        // The UIBarButtonItem is created and set in the view.
        let backBarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButton
    }
    
    
    /// Establece el retroceder del header en modo largo --> Retorna un Custom View
    /// - Parameters:
    ///     - title: El título que tendrá el retroceder
    func setNavBarLargeBackButton(title: String = NSLocalizedString("button_back", comment: "")){
        let backImage = UIImage(systemName: "chevron.backward")
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120.0, height: 40.0))
        backButton.setImage(backImage, for: .normal)
        backButton.setTitle(title, for: .normal)
        backButton.tintColor = .white
        backButton.titleEdgeInsets = UIEdgeInsets(top: 20.0, left: 5.0, bottom: 20.0, right: 0.0)
        backButton.contentHorizontalAlignment = .left
        backButton.addTarget(self, action: #selector(dismissViewController2), for: UIControl.Event.touchUpInside)
        backButton.titleLabel?.minimumScaleFactor = 0.5;
        backButton.titleLabel?.adjustsFontSizeToFitWidth = true;
        let backBarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButton
    }
    
    
    /// Es la función que permite devolverse al botón de retroceder
    @objc func dismissViewController2(){
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    // MARK: - Alerts
    // setSuccessCustomAlert(title: "Este el titulo", subtitle: "jaj jaj jaja jaja jaajj ajajaj jaja")
    
    
    /// Establece la alerta personalizada con el mensaje de éxito
    /// - Parameters:
    ///     - title: El título de la alerta
    ///     - subtitle: El título de la alerta
    func setSuccessCustomAlert(title: String, subtitle: String) {
        let sb = UIStoryboard(name: "CustomAlert", bundle: nil)
        let alert = sb.instantiateInitialViewController()! as! CustomAlertViewController
        alert.alertInfo = CustomAlertInfo(
            stateImage: UIImage(named: "icon.success"),
            stateColor: UIColor.successColor,
            containerViewBG: UIColor.white,
            image: UIImage(named: "general.logo")!,
            title: title,
            description: subtitle,
            buttonText: "Siguiente",
            buttonBG: UIColor.successColor)
        self.present(alert, animated: true)
    }
    
    
    /// Establece la alerta personalizada con el mensaje de éxito
    /// - Parameters:
    ///     - title: El título de la alerta
    ///     - subtitle: El título de la alerta
    func setErrorCustomAlert(title: String, subtitle: String) {
        let sb = UIStoryboard(name: "CustomAlert", bundle: nil)
        let alert = sb.instantiateInitialViewController()! as! CustomAlertViewController
        alert.alertInfo = CustomAlertInfo(
            stateImage: UIImage(named: "icon.error"),
            stateColor: UIColor.errorColor,
            containerViewBG: UIColor.white,
            image: UIImage(named: "general.logo")!,
            title: title,
            description: subtitle,
            buttonText: "Siguiente",
            buttonBG: UIColor.errorColor)
        self.present(alert, animated: true)
    }
}
