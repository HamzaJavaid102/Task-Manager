//
//  Timing.swift
//  Dryzzle
//
//  Created by Muhammad Salman Zafar on 4/26/20.
//  Copyright © 2020 Muhammad Salman Zafar. All rights reserved.
//

import Foundation

struct Timing: Equatable {
    
    let day: Int
    var hour: Int
    var minutes: Int
    let month: Int
    let year: Int
    var key: String
    
    init(day: Int, hour: Int, minutes: Int, month: Int = 5, year: Int = 2019, key: String = "none") {
        self.day = day
        self.hour = hour
        self.minutes = minutes
        self.month = month
        self.year = year
        self.key = key
    }
    
}
