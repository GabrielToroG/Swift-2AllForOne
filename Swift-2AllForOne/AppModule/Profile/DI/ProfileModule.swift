//
//  ProfileModule.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 31-07-23.
//

import Foundation
import Swinject

final class ProfileModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

private extension ProfileModule {
    func injectPresentation() {
        container.register(ProfileViewModel.self) { resolver in
            return ProfileViewModel()
        }
        container.register(ProfileViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(ProfileViewModel.self)!
            return ProfileViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }
    }
}
