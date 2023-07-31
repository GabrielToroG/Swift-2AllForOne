//
//  ProfileViewController.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 31-07-23.
//

import Foundation

import UIKit

final class ProfileViewController: BaseViewController<ProfileViewModel> {
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
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.onClick { [weak self] in
            guard let self = self else { return }
            self.coordinator.pushViewController(newViewControllerType: DataTransferViewController.self)
        }
        return button
    }()
}

// MARK: - Lifecycle
extension ProfileViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
}

// MARK: - UI Functions
extension ProfileViewController {
    private func configUI() {
        configBasic(Constants.Base.General.title, Constants.Base.General.color)
        configConstraints()
    }
    
    private func configConstraints() {
        view.addSubview(nextButton)
        let nextButtonConstraints = [
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(nextButtonConstraints)
    }
}
