//
//  MainTabBarModule.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 31-07-23.
//

import Foundation
import Swinject

final class MainTabBarModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

private extension MainTabBarModule {
    func injectPresentation() {
        container.register(MainTabBarController.self) { resolver in
            return MainTabBarController()
        }
    }
}
