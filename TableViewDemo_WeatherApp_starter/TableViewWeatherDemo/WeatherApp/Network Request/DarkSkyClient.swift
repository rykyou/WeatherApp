//
//  DarkSkyClient.swift
//  WeatherApp
//
//  Created by Williamson, Folarin on 5/4/19.
//  Copyright © 2019 Williamson, Folarin. All rights reserved.
//

import Foundation

public enum RequestError: Swift.Error {
    case invalidURL
    case responseError
    case noData
}

public enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case error(Error)
}

typealias DarkSkyCompletionHandler = (Result<WeatherData, RequestError>) -> Void

struct DarkSkyClient {
    private static let apiKey = "ccedf955fea93588a2c2489a803e8bc2"
    
    static func request(city: City, completionHandler: @escaping DarkSkyCompletionHandler) {
        guard let url = URL(string: "https://api.darksky.net/forecast/\(apiKey)/\(city.latitude),\(city.longitude)?exclude=hourly,minutely,flags") else {
           return completionHandler(.error(RequestError.invalidURL))
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completionHandler(.error(.responseError))
            }
            
            guard let data = data else {
               return completionHandler(.error(.noData))
            }
            
            let weatherData = WeatherDataManager.json(data, city)
            
            completionHandler(.success(weatherData))
        }
        
        task.resume()
    }
}
