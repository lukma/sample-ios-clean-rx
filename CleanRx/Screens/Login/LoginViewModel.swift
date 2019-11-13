//
//  LoginViewModel.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import RxSwift

internal final class LoginViewModel {
    
    private let sessionRepository = container.resolve(SessionRepository.self)!
    private let authRepository = container.resolve(AuthRepository.self)!
    private let disposeBag = DisposeBag()
    
    private let loadingSubject = PublishSubject<Bool>()
    var loading: Observable<Bool> { loadingSubject.asObservable() }
    
    func login(username: String, password: String) -> Observable<Void> {
        let loginSubject = PublishSubject<Void>()
        authRepository.login(username: username, password: password)
            .flatMapCompletable({ token in self.sessionRepository.storeSession(token: token) })
            .do(
                onSubscribed: { self.loadingSubject.onNext(true) },
                onDispose: { self.loadingSubject.onNext(false) }
            )
            .subscribe(
                onCompleted: { loginSubject.onNext(()) },
                onError: { err in loginSubject.onError(err) }
            )
            .disposed(by: disposeBag)
        return loginSubject.asObservable()
    }
}
