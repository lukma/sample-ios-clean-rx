//
//  ValidationUtil.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import Foundation

func validateForm(
    _ toValidate: [(rule: () -> Bool, error: Error)],
    onValid: () -> Void,
    onError: (Error) -> Void
) {
    let notAllowed = toValidate.first { value -> Bool in value.rule() }
    if let error = notAllowed?.error {
        print(error.localizedDescription)
        onError(error)
    } else {
        onValid()
    }
}

enum ValidationError: Error {
    case fieldBlank(_ field: String)
}

extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case let .fieldBlank(field):
            let format = "General.Error.FieldEmpty".toLocalized()
            return String(format: format, field)
        }
    }
}
