//
//  AuthRepository.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import RxSwift

protocol AuthRepository {
    func login(username: String, password: String) -> Single<Token>
}
