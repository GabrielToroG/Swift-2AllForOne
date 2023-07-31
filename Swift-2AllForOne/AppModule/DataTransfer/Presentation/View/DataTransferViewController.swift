//
//  DataTransferViewController.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 31-07-23.
//

import Foundation
import UIKit

final class DataTransferViewController: BaseViewController<DataTransferViewModel> {
    private enum Constants {
        enum Base {
            enum General {
                static let title: String = ""
                static let color: UIColor = UiConstants.primaryBackgroundColor
            }
        }
    }
    // Properties
    
    // Outlets
}

// MARK: - Lifecycle
extension DataTransferViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
}

// MARK: - UI Functions
extension DataTransferViewController {
    private func configUI() {
        navigationItem.hidesBackButton = true

        configBasic(Constants.Base.General.title, Constants.Base.General.color)
        configNavigation()
        configConstraints()
    }

    private func configNavigation() {
        let rightBarButton = UIBarButtonItem(
            title: "Edit",
            style: .plain,
            target: self,
            action: #selector(didTapRightBarButton))
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.black
        ]
        rightBarButton.setTitleTextAttributes(attributes, for: .normal)
        navigationItem.rightBarButtonItem = rightBarButton
    }

    private func configConstraints() {
        
    }
    @objc func didTapRightBarButton() {
        self.coordinator.popViewControllerToLeft(viewController: self)
    }
}
