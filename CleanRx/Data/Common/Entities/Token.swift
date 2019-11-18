//
//  Token.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import Foundation

struct Token: Decodable, Encodable {
    var accessToken: String
    var refreshToken: String
    var expireAt: Date
    var tokenType: String
}
