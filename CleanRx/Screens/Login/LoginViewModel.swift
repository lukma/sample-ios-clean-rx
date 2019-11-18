//
//  LoginViewModel.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import RxSwift

internal final class LoginViewModel {
    
    private let sessionRepository: SessionRepository
    private let authRepository: AuthRepository
    private let disposeBag = DisposeBag()
    
    init(sessionRepository: SessionRepository, authRepository: AuthRepository) {
        self.sessionRepository = sessionRepository
        self.authRepository = authRepository
    }
    
    private let loadingSubject = PublishSubject<Bool>()
    var loading: Observable<Bool> { loadingSubject.asObservable() }
    
    func login(username: String, password: String) -> Observable<Void> {
        let loginSubject = PublishSubject<Void>()
        
        let toValidate = [
            ({ username.isEmpty }, ValidationError.fieldBlank("General.Placeholder.Username".toLocalized())),
            ({ password.isEmpty }, ValidationError.fieldBlank("General.Placeholder.Password".toLocalized()))
        ]
        validateForm(
            toValidate,
            onValid: {
                authRepository.login(username: username, password: password)
                    .flatMapCompletable(sessionRepository.storeSession(token:))
                    .do(
                        onSubscribed: { self.loadingSubject.onNext(true) },
                        onDispose: { self.loadingSubject.onNext(false) }
                    )
                    .subscribe(
                        onCompleted: { loginSubject.onNext(()) },
                        onError: loginSubject.onError(_:)
                    )
                    .disposed(by: disposeBag)
            },
            onError: loginSubject.onError(_:)
        )
        
        return loginSubject.asObservable()
    }
}
