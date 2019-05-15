//
//  DarkSkyNetworkClient.swift
//  WeatherDetailExample
//
//  Created by Bajis, Thomas (CONT) on 5/3/19.
//  Copyright © 2019 Bajis, Thomas (CONT). All rights reserved.
//

import Foundation

struct DarkSkyNetworkClient: DarkSkyClient {
    let apiKey: String
    let session: URLSession = URLSession.shared

    func fetchWeather(at location: (lat: String, lon: String),
                      completion: @escaping (Result<DarkSkyForecast, DarkSkyNetworkError>) -> Void) {
        let url = constructUrl(key: apiKey,
                               scheme: DarkSkyNetworkConstants.Scheme,
                               method: DarkSkyNetworkConstants.Method,
                               endPoint: DarkSkyNetworkConstants.EndPoint,
                               location: location)

        let request = URLRequest(url: url)

        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let response  = response as? HTTPURLResponse else { return }

                guard response.statusCode == 200 else {
                    completion(.failure(.statusCodeError(response.statusCode)))
                    return
                }

                guard let data = data,
                    let forecast = try? JSONDecoder().decode(DarkSkyForecast.self, from: data) else {
                        completion(.failure(.malformedResponse))
                        return
                }

                completion(.success(forecast))
            }
        }
        task.resume()
    }

    private func constructUrl(key: String,
                              scheme: String,
                              method: String,
                              endPoint: String,
                              location: (lat: String, lon: String)) -> URL {
        let locationString = location.lat + "," + location.lon
        let fullUrlString = scheme + "://" + method + "/" + endPoint + "/" + apiKey + "/" + locationString

        return URL(string: fullUrlString)!
    }
}
