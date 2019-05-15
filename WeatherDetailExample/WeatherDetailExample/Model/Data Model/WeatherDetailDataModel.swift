//
//  WeatherDetailDataModel.swift
//  WeatherDetailExample
//
//  Created by Bajis, Thomas (CONT) on 5/3/19.
//  Copyright © 2019 Bajis, Thomas (CONT). All rights reserved.
//

enum TimeOfDay {
    case morning
    case noon
    case afternoon
    case evening
    case night
}

struct WeatherDetailDataModel {
    let cityName: String
    let icon: String
    let message: String?
    let temperature: Int
    let description: String
    let highTemperature: Int
    let lowTemperature: Int
    let rainPercentage: Int
    let humidityPercentage: Double
    let windspeed: Int
    let uvindex: Int
    let timeOfDay: TimeOfDay
}
