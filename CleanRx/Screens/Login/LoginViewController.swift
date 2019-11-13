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
    
    private let viewModel = LoginViewModel()

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loading
            .subscribe(onNext: { isLoading in
                if (isLoading) {
                    self.loadingIndicator.startAnimating()
                    self.loginButton.isEnabled = true
                } else {
                    self.loadingIndicator.stopAnimating()
                    self.loginButton.isEnabled = false
                }
            })
            .disposed(by: disposeBag)
    }

    @IBAction func onLoginClicked(_ sender: Any) {
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        let toValidate = [
            ({ username.isEmpty }, ValidationError.fieldBlank("General.Placeholder.Username".toLocalized())),
            ({ password.isEmpty }, ValidationError.fieldBlank("General.Placeholder.Password".toLocalized()))
        ]
        validateForm(
            toValidate,
            onValid: {
                viewModel.login(username: username, password: password)
                    .subscribe(
                        onNext: { _ in self.setRootView(MainViewController()) },
                        onError: { err in self.showErrorAlert(err) }
                    )
                    .disposed(by: disposeBag)
            },
            onError: { err in self.showErrorAlert(err) }
        )
    }
}
