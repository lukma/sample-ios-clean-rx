//
//  String+Ext.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import Foundation

extension String {
    func toLocalized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}
