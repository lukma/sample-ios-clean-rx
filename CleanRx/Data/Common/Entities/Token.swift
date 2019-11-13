//
//  Token.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import Foundation

struct Token: Decodable {
    var accessToken: String
    var refreshToken: String
    var expireAt: Date
    var tokenType: String
}

extension Token {
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expireAt = "expire_at"
        case tokenType = "token_type"
    }
}
