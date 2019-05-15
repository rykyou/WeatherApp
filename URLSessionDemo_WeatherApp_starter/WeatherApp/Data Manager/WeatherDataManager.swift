//
//  WeatherDataManager.swift
//  WeatherApp
//
//  Created by Williamson, Folarin on 5/3/19.
//  Copyright © 2019 Williamson, Folarin. All rights reserved.
//

import Foundation
import MapKit

struct WeatherDataManager {
    static func json(_ data: Data, _ city: City) -> WeatherData {
        var weatherData = try! JSONDecoder().decode(WeatherData.self, from: data)
        weatherData.city = city.name
        weatherData.country = city.country
        return weatherData
    }
    
    static func convertUTCToLocal(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let time = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone(abbreviation: "EST")
        dateFormatter.dateFormat = "h:mm a"
        
        return dateFormatter.string(from: time!)
    }
}
