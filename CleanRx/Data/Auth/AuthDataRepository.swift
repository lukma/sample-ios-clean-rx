//
//  AuthDataRepository.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import Foundation
import Moya
import RxMoya
import RxSwift

class AuthDataRepository: AuthRepository {
    
    private let provider: MoyaProvider<AuthService>
    private let sessionRepository: SessionRepository
    
    init(provider: MoyaProvider<AuthService>, sessionRepository: SessionRepository) {
        self.provider = provider
        self.sessionRepository = sessionRepository
    }
    
    func login(username: String, password: String) -> Single<Token> {
        return provider.rx.request(.login(username: username, password: password))
            .mapWithDefaultConfig(Token.self)
    }
}
