//
//  Font.swift
//  canva
//
//  Created by Muhammad Salman on 5/13/22.
//

import Foundation
import UIKit

enum Font: String {
    case regular = "Helvetica"
    case medium = "Avenir-Medium"
    case light = "Helvetica-Light"
    case bold = "Helvetica-Bold"
}

extension Font {
    func font(size: CGFloat = 17) -> UIFont {
        UIFont(font: self, size: size)
    }
}
