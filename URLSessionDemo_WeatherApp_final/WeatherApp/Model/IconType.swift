//
//  IconType.swift
//  WeatherApp
//
//  Created by Williamson, Folarin on 5/4/19.
//  Copyright © 2019 Williamson, Folarin. All rights reserved.
//

import Foundation

enum IconType: String {
    case clear = "clear"
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    
    case fog = "fog"
    case fogDay = "fog-day"
    case fogNight = "fog-night"
    
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
    
    case rain = "rain"
    case rainDay = "rain-day"
    case rainNight = "rain-night"
    
    case snow = "snow"
    case snowDay = "snow-day"
    case snowNight = "snow-night"
    
    case thunderstorm = "thunderstorm"
    case thunderstormDay = "thunderstorm-day"
    case thunderstormNight = "thunderstorm-night"
    
    init(_ icon: String) {
        switch icon {
        case "clear":
            self = .clear
        case "clear-day":
            self = .clearDay
        case "clear-night":
            self = .clearNight
        case "fog":
            self = .fog
        case "fog-day":
            self = .fogDay
        case "fog-night":
            self = .fogNight
        case "partly-cloudy-day":
            self = .partlyCloudyDay
        case "partly-cloudy-night":
            self = .partlyCloudyNight
        case "rain":
            self = .rain
        case "rain-day":
            self = .rainDay
        case "rain-night":
            self = .rainNight
        case "snow":
            self = .snow
        case "snow-day":
            self = .snowDay
        case "snow-night":
            self = .snowNight
        case "thunderstorm":
            self = .thunderstorm
        case "thunderstorm-day":
            self = .thunderstormDay
        case "thunderstorm-night":
            self = .thunderstormNight
        default:
            self = .clear
        }
    }
}
