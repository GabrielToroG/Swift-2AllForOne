//
//  MainControllerProvider.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 31-07-23.
//

import Foundation
import Swinject

final class MainControllerProvider {
    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject(homeCoordinator: TabBarCoordinator?) {
        container.register(TabBarCoordinator?.self) { _ in
            homeCoordinator
        }
    }
    func getTabBar() -> UITabBarController {
        container.resolve(MainTabBarController.self)!
    }
    func getMainHome() -> UIViewController {
        container.resolve(HomeViewController.self)!
    }
    func getProfile() -> UIViewController {
        container.resolve(ProfileViewController.self)!
    }
}
