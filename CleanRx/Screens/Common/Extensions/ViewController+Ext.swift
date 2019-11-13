//
//  ViewController+Ext.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import UIKit

extension UIViewController {
    func setRootView(_ viewController: UIViewController) {
        let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        
        sceneDelegate?.window?.rootViewController = navigationController
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    
    func navigateTo(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showErrorAlert(_ content: Error) {
        let alert = UIAlertController(title: content.localizedDescription, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        self.present(alert, animated: true, completion: nil)
        
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}

