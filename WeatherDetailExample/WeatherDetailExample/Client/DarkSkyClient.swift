//
//  DarkSkyClient.swift
//  WeatherDetailExample
//
//  Created by Bajis, Thomas (CONT) on 5/5/19.
//  Copyright © 2019 Bajis, Thomas (CONT). All rights reserved.
//

enum DarkSkyNetworkError: Error {
    case statusCodeError(Int)
    case malformedResponse
}

protocol DarkSkyClient {
    func fetchWeather(at location: (lat: String, lon: String),
                      completion: @escaping (Result<DarkSkyForecast, DarkSkyNetworkError>) -> Void)
}
