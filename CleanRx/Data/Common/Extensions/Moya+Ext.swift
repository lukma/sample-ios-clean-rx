//
//  Moya+Ext.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import Foundation
import Moya

extension TargetType {
    
    var baseURL: URL { URL(string: "https://private-30c186-lukmaice.apiary-mock.com")! }
    
    var headers: [String : String]? {
        [
            "Authorization": "Basic bHVrbWE6Z2VsYWRhazc="
        ]
    }
    
    var sampleData: Data {
        // Todo - Will implement this if do unit test
        "".data(using: .utf8)!
    }
}

func buildDefaultJsonDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    return decoder
}
