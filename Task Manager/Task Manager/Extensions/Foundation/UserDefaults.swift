//
//  UserDefaults.swift
//  QCSM4
//
//  Created by Yasir Basharat on 19/08/2019.
//  Copyright © 2019 Yasir Basharat. All rights reserved.
//
import Foundation

extension UserDefaults {
    
    struct AppUserDefault {
        static let token = "token"
        static let userProfile = "userProfile"
        static let trip = "trip"
        static let waitingTime = "waitingTime"
        static let time = "time"
        static let km = "km"
        static let userKmCalculation = "userKmCalculation"
        static let trackUserKM = "trackUserKM"
        static let lastLocation = "lastLocation"
        static let lastDate = "lastDate"
        static let droppedAt = "droppedAt"
        static let pickedAt = "pickedAt"
        static let tripStarted = "tripStarted"
        static let language = "Language"
        static let arePushNotificationEnabled = "pushNotificaions"
        static let userDefinedFixedRate = "userDefinedFixedRate"
        static let userDefinedEnabled = "userDefinedFixedRateEnabled"
        static let publicHolidayEnabled = "publicHolidayEnabled"
        static let dayCycle = "dayCycle"
        static let appLanguage = "appLanguage"
        static let authToken = "authToken"
    }
}
