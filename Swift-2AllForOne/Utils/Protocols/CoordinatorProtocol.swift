//
//  CoordinatorProtocol.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 30-07-23.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    func didDeinit(_ coordinator: CoordinatorProtocol)
    func start()
    func reset()
}
