//
//  Injection.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 31-07-23.
//

import Foundation
import Swinject

final class Injection {
    static let shared = Injection()
    private let container: Container
    let controllerProvider: MainControllerProvider

    private init() {
        container = Container()
        controllerProvider = .init(container)
        injectDependencies()
    }

    private func injectDependencies() {
        MainModule(container).inject()
        MainTabBarModule(container).inject()
        HomeModule(container).inject()
        ProfileModule(container).inject()
        DataTransferModule(container).inject()
    }
    
    func getContainer() -> Container {
        return container
    }

    func resolve<T>(_ serviceType: T.Type) -> T {
      return container.resolve(serviceType)!
    }
    
//    func inject(tabBarCoordinator: MainTabBarCoordinator?) {
//        container.register(MainTabBarCoordinator?.self) { _ in
//            tabBarCoordinator
//        }
//    }
}
