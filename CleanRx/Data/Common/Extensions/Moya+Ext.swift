//
//  Moya+Ext.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import Foundation
import Moya
import RxSwift

extension TargetType {
    
    var baseURL: URL { URL(string: "https://private-30c186-lukmaice.apiary-mock.com")! }
    
    var headers: [String : String]? {
        [
            "Accept-Language": "id"
        ]
    }
    
    var sampleData: Data {
        // Todo - Will implement this if do unit test
        "".data(using: .utf8)!
    }
}

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    func mapWithDefaultConfig<D: Decodable>(_ type: D.Type) -> Single<D> {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return flatMap { .just(try $0.map(type, atKeyPath: "data", using: decoder)) }
    }
}
