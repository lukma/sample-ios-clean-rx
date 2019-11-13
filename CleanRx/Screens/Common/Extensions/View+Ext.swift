//
//  View+Ext.swift
//  CleanRx
//
//  Created by Lukma Gayo Arizky on 13/11/19.
//  Copyright © 2019 Lukma Gayo Arizky. All rights reserved.
//

import UIKit

extension UILabel {
    @IBInspectable var textLocalized: String? {
        get { return text }
        
        set (newValue) {
            var text = self.text
            if let value = newValue {
                text = value.toLocalized()
            }
            self.text = text
        }
    }
}

extension UITextField {
    @IBInspectable var placeholderLocalized: String? {
        get { return placeholder }
        
        set (newValue) {
            var placeholder = self.placeholder
            if let value = newValue {
                placeholder = value.toLocalized()
            }
            self.placeholder = placeholder
        }
    }
}

extension UIButton {
    @IBInspectable var titleLocalized: String? {
        get { return currentTitle }
        
        set (newValue) {
            var title = currentTitle
            if let value = newValue {
                title = value.toLocalized()
            }
            setTitle(title, for: UIControl.State.normal)
        }
    }
}
