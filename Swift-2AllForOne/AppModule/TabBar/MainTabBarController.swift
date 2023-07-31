//
//  MainTabBarController.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 31-07-23.
//

import UIKit

final class MainTabBarController: UITabBarController {

    private var homeViewController: UIViewController!
    private var profileViewController: UIViewController!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configVCs()
    }

    private func createNavController(
        for rootViewController: UIViewController,
        title: String,
        image: UIImage
    ) -> UIViewController {
        let navController = UINavigationController(
            rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }

    private func configVCs() {
        homeViewController = Injection.shared.controllerProvider.getMainHome()
        profileViewController = Injection.shared.controllerProvider.getProfile()
        let newViewControllers = [
            createNavController(for: homeViewController,
                                title: "Inicio",
                                image: UIImage(systemName: "house")!),
            createNavController(for: profileViewController,
                                title: "Perfil",
                                image: UIImage(systemName: "house")!)
        ]
        for (index, item) in newViewControllers.enumerated() {
            item.tabBarItem.tag = index
        }
        setViewControllers(newViewControllers, animated: false)
    }
    
    
}
