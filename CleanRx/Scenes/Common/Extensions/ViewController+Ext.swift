//
//  ViewController+Ext.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import UIKit

extension UIViewController {
    func getAppCoordinator() -> AppCoordinator? {
        let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate
        return sceneDelegate?.appCoordinator
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

