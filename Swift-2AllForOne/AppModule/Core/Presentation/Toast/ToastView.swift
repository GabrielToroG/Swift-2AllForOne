//
//  ToastView.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 31-07-23.
//

import UIKit

// MARK: - Class
class ToastView: UIView {
    private enum Constants {
        enum View {
            enum Container {
                static let color: UIColor = .black
                static let cornerRadius: CGFloat = 4
            }
        }
        enum ImageView {
            enum Icon {
                static let color: UIColor = .white
                static let image: UIImage? = UIImage(systemName: "house")
            }
        }
        enum Label {
            enum Message {
                static let text: String = "La lista ha sido eliminada."
                static let textColor: UIColor = .white
                static let font: UIFont = .systemFont(ofSize: 13)
            }
        }
    }

    // Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.View.Container.color
        view.layer.cornerRadius = Constants.View.Container.cornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.ImageView.Icon.image
        imageView.tintColor = Constants.ImageView.Icon.color
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Label.Message.text
        label.textColor = Constants.Label.Message.textColor
        label.font = Constants.Label.Message.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Functions
extension ToastView {
    private func setupViews() {
        addSubview(containerView)
        containerView.addSubview(iconImageView)
        containerView.addSubview(messageLabel)

        let containerViewConstraints = [
            containerView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 0),
            containerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 36),
            containerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -36),
            containerView.heightAnchor.constraint(
                equalToConstant: 4)
        ]
        let iconImageViewConstraints = [
            iconImageView.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor),
            iconImageView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 8),
            iconImageView.widthAnchor.constraint(
                equalToConstant: 24),
            iconImageView.heightAnchor.constraint(
                equalToConstant: 24)
        ]
        let textLabelConstraints = [
            messageLabel.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor),
            messageLabel.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: 8),
            messageLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -8)
        ]

        NSLayoutConstraint.activate(
            containerViewConstraints +
            iconImageViewConstraints +
            textLabelConstraints
        )
    }
}
