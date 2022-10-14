//
//  CustomAlertViewController.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Toro on 13-10-22.
//

import UIKit

class CustomAlertViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var stateImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titileLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!

    // MARK: - Variables
    var alertInfo = CustomAlertInfo()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if alertInfo.title != nil {
            stateImage.image = alertInfo.stateImage
            stateImage.tintColor = alertInfo.stateColor
            containerView.backgroundColor = alertInfo.containerViewBG
            logoImage.image = alertInfo.image
            titileLabel.text = alertInfo.title
            descriptionLabel.text = alertInfo.description
            nextButton.setTitle(alertInfo.buttonText, for: .normal)
            nextButton.backgroundColor = alertInfo.buttonBG
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stateView.setBorder(color: .clear, round: .half)
        containerView.setBorder(color: .clear, round: .number(10))
        nextButton.setBorder(color: .clear, round: .half)
    }
    

    // MARK: - Actions
    @IBAction func removeAlert(_ sender: Any) {
        dismiss(animated: true)
    }
}
