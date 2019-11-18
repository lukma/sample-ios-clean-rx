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
            .subscribe({ _ in
                guard let appCoordinator = self.getAppCoordinator() else { return }
                appCoordinator.initialState = .login
                appCoordinator.start()
            })
            .disposed(by: disposeBag)
    }
}
