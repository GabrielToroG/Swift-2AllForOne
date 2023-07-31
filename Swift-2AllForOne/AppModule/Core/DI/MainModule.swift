//
//  MainModule.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 31-07-23.
//

import Foundation
import Swinject

final class MainModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        container.register(Coordinator.self) { _ in
                .init(container: self.container)
        }
        container.register(NotificationCenter.self) { _ in
            .default
        }
        container.register(NotificationCenterWrapper.self) { resolver in
            NotificationCenterWrapperImpl(
                notificationCenter: resolver.resolve(NotificationCenter.self)!)
        }
    }
}
