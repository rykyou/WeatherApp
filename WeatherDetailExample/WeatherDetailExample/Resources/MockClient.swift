//
//  MockClient.swift
//  WeatherDetailExample
//
//  Created by Bajis, Thomas (CONT) on 5/5/19.
//  Copyright © 2019 Bajis, Thomas (CONT). All rights reserved.
//

import Foundation

struct MockClient: DarkSkyClient {
    let responseType: ResponseType

    enum ResponseType {
        case success
        case networkError
        case malformedResponse
    }

    func fetchWeather(at location: (lat: String, lon: String), completion: @escaping (Result<DarkSkyForecast, DarkSkyNetworkError>) -> Void) {
        guard let file = Bundle.main.path(forResource: "mockResponse", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: file), options: []),
            let forecast = try? JSONDecoder().decode(DarkSkyForecast.self, from: data) else { return }

        let result: Result<DarkSkyForecast, DarkSkyNetworkError>
        switch responseType {
        case .success:
            result = .success(forecast)
        case .networkError:
            result = .failure(.statusCodeError(500))
        case .malformedResponse:
            result = .failure(.malformedResponse)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(result)
        }
    }
}
