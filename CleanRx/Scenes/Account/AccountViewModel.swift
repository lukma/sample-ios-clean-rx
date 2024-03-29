//
//  AccountViewModel.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import RxSwift

internal final class AccountViewModel {
    
    private let sessionRepository: SessionRepository
    
    init(sessionRepository: SessionRepository) {
        self.sessionRepository = sessionRepository
    }
    
    func logout() -> Observable<Never> {
        return sessionRepository.clearSession().asObservable()
    }
}
