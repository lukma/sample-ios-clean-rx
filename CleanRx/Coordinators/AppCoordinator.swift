//
//  AppCoordinator.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 18/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    let window: UIWindow
    var initialState: InitialState? = nil
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        guard let initialState = initialState else { return }
        let viewController: UIViewController
        switch initialState {
        case .login:
            viewController = LoginViewController()
        case .main:
            viewController = MainViewController()
        }
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

enum InitialState {
    case login
    case main
}
