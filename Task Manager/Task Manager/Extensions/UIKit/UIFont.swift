//
//  UIFont.swift
//  canva
//
//  Created by Muhammad Salman on 5/13/22.
//

import UIKit

extension UIFont {
    
    convenience init(font: Font, size: CGFloat = 17) {
        self.init(name: font.rawValue, size: size)!
    }
    
}
