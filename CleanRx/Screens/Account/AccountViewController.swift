//
//  AccountViewController.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import UIKit
import RxSwift

class AccountViewController: UIViewController {
    
    private let viewModel = container.resolve(AccountViewModel.self)!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onLogoutClicked(_ sender: Any) {
        viewModel.logout()
            .subscribe({ _ in self.setRootView(LoginViewController()) })
            .disposed(by: disposeBag)
    }
}
