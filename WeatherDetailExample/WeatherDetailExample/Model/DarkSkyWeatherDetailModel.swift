//
//  DarkSkyWeatherDetailModel.swift
//  WeatherDetailExample
//
//  Created by Bajis, Thomas (CONT) on 5/3/19.
//  Copyright © 2019 Bajis, Thomas (CONT). All rights reserved.
//

import Foundation

class DarkSkyWeatherDetailModel: WeatherDetailModel {
    let location: (lat: String, lon: String)
    let client: DarkSkyClient
    let calendar: Calendar

    init(location: (lat: String, lon: String),
         client: DarkSkyClient,
         calendar: Calendar = Calendar.current) {
        self.location = location
        self.client = client
        self.calendar = calendar
    }

    func fetchLocalWeather(_ completionHandler: @escaping (Result<WeatherDetailDataModel, FetchWeatherUIError>) -> Void) {
        client.fetchWeather(at: location) { [weak self] (forecastResult) in
            guard let strongSelf = self else { return }

            switch forecastResult {
            case .success(let forecast):
                let time = forecast.currently.time
                let timeOfDay = strongSelf.timeOfDay(from: time)
                let chanceOfRain = Int(forecast.currently.precipProbability)
                let windspeed = Int(forecast.currently.windSpeed)
                let message = forecast.daily.data.first?.summary

                let dataModel = WeatherDetailDataModel(cityName: forecast.timezone,
                                                       icon: forecast.currently.icon,
                                                       message: message,
                                                       temperature: forecast.currentTemperature,
                                                       description: forecast.currently.summary,
                                                       highTemperature: forecast.highTemperature,
                                                       lowTemperature: forecast.lowTemperature,
                                                       rainPercentage: chanceOfRain,
                                                       humidityPercentage: forecast.currently.humidity,
                                                       windspeed: windspeed,
                                                       uvindex: forecast.currently.uvIndex,
                                                       timeOfDay: timeOfDay)
                completionHandler(.success(dataModel))
            case .failure(let forecastError):
                switch forecastError {
                case .statusCodeError(_):
                    completionHandler(.failure(.networkError))
                case .malformedResponse:
                    completionHandler(.failure(.malformedResponse))
                }
            }
        }
    }

    private func timeOfDay(from unixTime: Double) -> TimeOfDay {
        let date = Date(timeIntervalSince1970: unixTime)
        let hour = calendar.component(.hour, from: date)

        switch hour {
        case 6..<12:
            return .morning
        case 12:
            return .noon
        case 13..<17:
            return .afternoon
        case 17..<20:
            return .evening
        default:
            return .night
        }
    }
}
