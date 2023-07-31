//
//  HomeViewController.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 31-07-23.
//

import UIKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    private enum Constants {
        enum Base {
            enum General {
                static let title: String = ""
                static let color: UIColor = .gray
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
            self.coordinator.pushViewControllerTabBar(
                viewController: self,
                newViewControllerType: DataTransferViewController.self)
        }
        return button
    }()
}

// MARK: - Lifecycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
}

// MARK: - UI Functions
extension HomeViewController {
    private func configUI() {
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
        navigationItem.leftBarButtonItem = rightBarButton
    }

    private func configConstraints() {
        view.addSubview(nextButton)
        let nextButtonConstraints = [
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(nextButtonConstraints)
    }
    @objc func didTapRightBarButton() {
        self.coordinator.pushViewControllerTabBar(
            viewController: self,
            newViewControllerType: DataTransferViewController.self)
    }
}
