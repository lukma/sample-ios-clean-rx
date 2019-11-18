//
//  AppModule.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 18/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import Swinject
import Moya

let container = Container()

func initAppModule() {
    // Repository
    container.register(SessionRepository.self) { _ in SessionDataRepository() }
    container.register(AuthRepository.self) { _ in
        let authPlugin = AccessTokenPlugin { "bHVrbWE6Z2VsYWRhazc=" }
        let provider = MoyaProvider<AuthService>(plugins: [authPlugin, NetworkLoggerPlugin()])
        let sessionRepository = container.resolve(SessionRepository.self)!
        return AuthDataRepository(provider: provider, sessionRepository: sessionRepository)
    }
    
    // ViewModel
    container.register(LoginViewModel.self) { _ in
        let sessionRepository = container.resolve(SessionRepository.self)!
        let authRepository = container.resolve(AuthRepository.self)!
        return LoginViewModel(sessionRepository: sessionRepository, authRepository: authRepository)
    }
    container.register(AccountViewModel.self) { _ in
        let sessionRepository = container.resolve(SessionRepository.self)!
        return AccountViewModel(sessionRepository: sessionRepository)
    }
}
