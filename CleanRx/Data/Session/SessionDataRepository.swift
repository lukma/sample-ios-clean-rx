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
    private let tokenKey = "tokenKey"
    
    func isAuthenticated() -> Single<Bool> {
        let hasToken = preferences.object(forKey: tokenKey) != nil
        return Single.just(hasToken)
    }
    
    func storeSession(token: Token) -> Completable {
        return Completable.create { completable in
            do {
                let jsonData = try JSONEncoder().encode(token)
                let jsonString = String(data: jsonData, encoding: .utf8)
                self.preferences.set(jsonString, forKey: self.tokenKey)
                completable(.completed)
            } catch let error {
                completable(.error(error))
            }
            return Disposables.create {}
        }
    }
    
    func clearSession() -> Completable {
        return Completable.create { completable in
            self.preferences.set(nil, forKey: self.tokenKey)
            completable(.completed)
            return Disposables.create {}
        }
    }
}
