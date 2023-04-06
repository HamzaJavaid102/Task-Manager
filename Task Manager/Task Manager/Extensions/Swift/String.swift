//
//  String.swift
//  Macmeter
//
//  Created by Muhammad Salman on 3/15/22.
//

import UIKit

extension String {
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, count) ..< count]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, r.lowerBound)),
                                            upper: min(count, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    var date: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: self) ?? Date()
    }
    
    var isValidDate: Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: self) != nil
    }
    
    var toImage: UIImage {
        UIImage(named: "\(self)")!
    }
    
    var toSystemImage: UIImage {
        UIImage(systemName: "\(self)")!
    }
    
    func boldFontWith(size: CGFloat) -> UIFont {
        for font in UIFont.fontNames(forFamilyName: self) {
            if font.lowercased().contains("bold") || font.lowercased().contains("heavy") {
                return UIFont(name: font, size: size) ?? Font.bold.font(size: size)
            }
        }
        return Font.bold.font(size: size)
    }
    
    func italicFontWith(size: CGFloat) -> UIFont {
        print(UIFont.fontNames(forFamilyName: self) )
        for font in UIFont.fontNames(forFamilyName: self) {
            if font.lowercased().contains("italic") || font.lowercased().contains("oblique") {
                return UIFont(name: font, size: size) ?? Font.bold.font(size: size)
            }
        }
        return Font.bold.font(size: size)
    }
    
    var validURL: Bool {
        get {
            let regEx = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
            let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regEx])
            return predicate.evaluate(with: self)
        }
    }
    
    func date(formatter: DateFormatter = Formatter.standard) -> Date? {
        if let date = formatter.date(from: self) {
            return date
        }
        return nil
    }
}
