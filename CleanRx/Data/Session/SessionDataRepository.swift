//
//  SessionDataRepository.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import Foundation
import RxSwift

class SessionDataRepository: SessionRepository {
    
    private let preferences = UserDefaults.standard
    private let isAuthenticatedKey = "isAuthenticated"
    
    func isAuthenticated() -> Single<Bool> {
        let isAuthenticated = preferences.bool(forKey: self.isAuthenticatedKey)
        return Single.just(isAuthenticated)
    }
    
    func storeSession(token: Token) -> Completable {
        return Completable.create { completable in
            self.preferences.set(true, forKey: self.isAuthenticatedKey)
            completable(.completed)
            return Disposables.create {}
        }
    }
    
    func clearSession() -> Completable {
        return Completable.create { completable in
            self.preferences.set(false, forKey: self.isAuthenticatedKey)
            completable(.completed)
            return Disposables.create {}
        }
    }
}
