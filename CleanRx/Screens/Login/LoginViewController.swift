//
//  LoginViewController.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
    
    private let viewModel = container.resolve(LoginViewModel.self)!

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loading
            .subscribe(onNext: { isLoading in
                self.loadingIndicator.showLoading(isLoading)
                self.loginButton.isEnabled = isLoading
            })
            .disposed(by: disposeBag)
    }

    @IBAction func onLoginClicked(_ sender: Any) {
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        viewModel.login(username: username, password: password)
            .subscribe(
                onNext: { _ in self.setRootView(MainViewController()) },
                onError: showErrorAlert(_:)
            )
            .disposed(by: disposeBag)
    }
}
