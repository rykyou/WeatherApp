//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Williamson, Folarin on 5/2/19.
//  Copyright © 2019 Williamson, Folarin. All rights reserved.
//

import UIKit
import MapKit

struct WeatherData: Decodable {
    var city: String = ""
    var country: String = ""
    var icon: IconType
    var currentTemperature: Int
    var temperatureLow: Int
    var temperatureHigh: Int
    var precipProbability: Double
    var time: String

    struct TemperatureData: Decodable {
        let temperatureLow: Double
        let temperatureHigh: Double
    }

    enum CodingKeys: CodingKey {
        case currently
        case daily
        case data
        case icon
        case latitude
        case longitude
        case precipProbability
        case temperature
        case time
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // currently node
        let currentlyContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .currently)
        let iconString = try currentlyContainer.decode(String.self, forKey: .icon)
        icon = IconType(iconString)
        let currentTemp = try currentlyContainer.decode(Double.self, forKey: .temperature)
        currentTemperature = Int(currentTemp)
        precipProbability = try currentlyContainer.decode(Double.self, forKey: .precipProbability)

        let unixTime = try currentlyContainer.decode(Int.self, forKey: .time)
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        let second = Calendar.current.component(.second, from: date)
        time = WeatherDataManager.convertUTCToLocal(date: "\(hour):\(minute):\(second)")

        // daily node
        let dailyContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .daily)
        let temperatureData = try dailyContainer.decode([TemperatureData].self, forKey: .data)
        let firstItem = temperatureData.first!
        temperatureLow = Int(firstItem.temperatureLow)
        temperatureHigh = Int( firstItem.temperatureHigh)
    }
}
