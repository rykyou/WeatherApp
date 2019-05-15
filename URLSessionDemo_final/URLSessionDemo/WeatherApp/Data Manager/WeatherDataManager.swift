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
    static func forecast(_ data: Data, city: City) -> WeatherForecast {
        var weatherData = try! JSONDecoder().decode(WeatherForecast.self, from: data)
        weatherData.city = city.name
        weatherData.state = city.state
        return weatherData
    }
    
}
