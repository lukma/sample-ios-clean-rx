//
//  MainViewController.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "house"), tag: 0)
        let accountViewController = AccountViewController()
        accountViewController.tabBarItem = UITabBarItem(title: "Account", image: UIImage(named: "person"), tag: 1)
        
        viewControllers = [homeViewController, accountViewController]

    }
}
