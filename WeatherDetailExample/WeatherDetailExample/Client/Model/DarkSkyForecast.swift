//
//  DarkSkyForecast.swift
//  WeatherDetailExample
//
//  Created by Bajis, Thomas (CONT) on 5/3/19.
//  Copyright © 2019 Bajis, Thomas (CONT). All rights reserved.
//

struct DarkSkyForecast: Decodable {
    let timezone: String
    let currently: DarkSkyCurrentForecast
    let daily: DarkSkyDailyForecast
}

extension DarkSkyForecast {
    var currentTemperature: Int {
        return Int(currently.apparentTemperature)
    }
    var highTemperature: Int {
        guard let high = daily.data.first?.temperatureHigh else {
            return currentTemperature
        }
        return Int(high)
    }
    var lowTemperature: Int {
        guard let low = daily.data.first?.temperatureLow else {
            return currentTemperature
        }
        return Int(low)
    }
}

struct DarkSkyCurrentForecast: Decodable {
    let summary: String
    let icon: String
    let time: Double
    let apparentTemperature: Double
    let precipProbability: Double
    let windSpeed: Double
    let humidity: Double
    let uvIndex: Int
}

struct DarkSkyDailyForecast: Decodable {
    let data: [DarkSkyDailyForecastData]
}

struct DarkSkyDailyForecastData: Decodable {
    let summary: String
    let temperatureHigh: Double
    let temperatureLow: Double
}
