//
//  WeatherForecast.swift
//  WeatherApp
//
//  Created by Williamson, Folarin on 5/2/19.
//  Copyright © 2019 Williamson, Folarin. All rights reserved.
//

import UIKit
import MapKit

struct WeatherForecast: Decodable {
    var city: String = ""
    var state: String = ""
    var icon: IconType
    var currentTemperature: Int

    enum CodingKeys: CodingKey {
        case currently
        case data
        case icon
        case temperature
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // currently node
        let currentlyContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .currently)
        let iconString = try currentlyContainer.decode(String.self, forKey: .icon)
        icon = IconType(iconString)
        let currentTemp = try currentlyContainer.decode(Double.self, forKey: .temperature)
        currentTemperature = Int(currentTemp)
    }
}
