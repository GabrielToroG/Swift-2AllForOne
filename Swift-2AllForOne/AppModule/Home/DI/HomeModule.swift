//
//  HomeModule.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 31-07-23.
//

import Swinject

final class HomeModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

private extension HomeModule {
    func injectPresentation() {
        container.register(HomeViewModel.self) { resolver in
            return HomeViewModel()
        }
        container.register(HomeViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(HomeViewModel.self)!
            return HomeViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }
    }
}
