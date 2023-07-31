//
//  DataTransferModule.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 31-07-23.
//

import Foundation
import Swinject

final class DataTransferModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

private extension DataTransferModule {
    func injectPresentation() {
        container.register(DataTransferViewModel.self) { resolver in
            return DataTransferViewModel()
        }
        container.register(DataTransferViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(DataTransferViewModel.self)!
            return DataTransferViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }
    }
}
