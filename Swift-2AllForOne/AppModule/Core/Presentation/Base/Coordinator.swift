//
//  Coordinator.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 31-07-23.
//

import UIKit
import Swinject

public final class Coordinator {
    private let container: Container
    weak var viewController: UIViewController?
    
    public init(
        container: Container
    ) {
        self.container = container
    }
    
    private func resolveArguments<V: UIViewController>(
        _ newViewControllerType: V.Type,
        _ name: String? = nil
    ) -> V {
        container.resolve(V.self, name: name)!
    }
    
    private func resolveArguments<V: UIViewController, T>(
        _ newViewControllerType: V.Type,
        _ name: String? = nil,
        _ args: T
    ) -> V {
        container.resolve(V.self, name: name, argument: args)!
    }
    
    // MARK: - Push
    
    public func pushViewController<V: UIViewController>(
        newViewControllerType: V.Type,
        name: String? = nil
    ) {
        let newViewController = resolveArguments(newViewControllerType, name)
        viewController?.navigationController?.pushViewController(
            newViewController,
            animated: true)
    }
    
    public func pushViewController<V: UIViewController, T>(
        newViewControllerType: V.Type,
        name: String? = nil,
        arg: T
    ) {
        let newViewController = resolveArguments(newViewControllerType, name, arg)
        viewController?.navigationController?.pushViewController(
            newViewController,
            animated: true)
    }
    

    // Esta función se usa en el Sidebar, porque no funciona el pushViewController
    public func pushViewControllerTabBar<V: UIViewController>(
        viewController: UIViewController,
        newViewControllerType: V.Type,
        name: String? = nil
    ) {
        let newViewController = resolveArguments(newViewControllerType, name)
        let transition = CATransition()
        transition.duration = 0.6
        transition.type = .reveal
        transition.subtype = .fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        viewController.view.window?.layer.add(transition, forKey: kCATransition)
        viewController.navigationController?.pushViewController(newViewController, animated: true)
    }

    // Función para devolverse desde derecha a izquierda
    public func popViewControllerToLeft(
        viewController: UIViewController
    ) {
        let transition = CATransition()
        transition.duration = 0.6
        transition.type = .reveal
        transition.subtype = .fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        viewController.view.window?.layer.add(transition, forKey: kCATransition)
        viewController.navigationController?.popViewController(animated: false)
    }
}
