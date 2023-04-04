//
//  NSAttributedString.swift
//  canva
//
//  Created by Muhammad Salman on 7/5/22.
//

import UIKit

extension NSAttributedString {
    
    var isUnderlineSelected: Bool {
        for attr in attributes(at: 0, effectiveRange: nil) {
            let isUnderline = attr.key == .underlineStyle
            if (isUnderline) && ((attr.value as? NSUnderlineStyle) == .single) {
                return true
            }
        }
        return false
    }
    
    var isStrikethroughSelected: Bool {
        for attr in attributes(at: 0, effectiveRange: nil) {
            let isStrikethrough = attr.key == .strikethroughStyle
            if (isStrikethrough) && ((attr.value as? NSUnderlineStyle) == .single) {
                return true
            }
        }
        return false
    }
    
}

