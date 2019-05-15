//
//  WeatherDetailModel.swift
//  WeatherDetailExample
//
//  Created by Bajis, Thomas (CONT) on 5/3/19.
//  Copyright © 2019 Bajis, Thomas (CONT). All rights reserved.
//

enum FetchWeatherUIError: Error {
    case networkError
    case malformedResponse
}

protocol WeatherDetailModel {
    func fetchLocalWeather(_ completionHandler: @escaping ((Result<WeatherDetailDataModel, FetchWeatherUIError>) -> Void))
}
