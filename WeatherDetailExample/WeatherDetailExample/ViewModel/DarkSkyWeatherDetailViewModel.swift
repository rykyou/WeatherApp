//
//  DarkSkyWeatherDetailViewModel.swift
//  WeatherDetailExample
//
//  Created by Bajis, Thomas (CONT) on 5/3/19.
//  Copyright © 2019 Bajis, Thomas (CONT). All rights reserved.
//

import Foundation

class DarkSkyWeatherDetailViewModel: WeatherDetailViewModel {

    // MARK: - ViewModel - View Bindings (Storage)

    var onCityImageUpdate: ((String) -> Void)?
    var onCityNameUpdate: ((String) -> Void)?
    var onTemperatureUpdate: ((String) -> Void)?
    var onDescriptionUpdate: ((String) -> Void)?
    var onTemperatureRangeUpdate: ((String) -> Void)?
    var onRainPercentageUpdate: ((String) -> Void)?
    var onWindspeedUpdate: ((String) -> Void)?
    var onHumidityPercentageUpdate: ((String) -> Void)?
    var onUvindexUpdate: ((String) -> Void)?
    var onMessageUpdate: ((String) -> Void)?
    var onAPIFailure: ((String) -> Void)?
    var onAPILoading: ((Bool) -> Void)?
    var onBackgroundColorUpdate: ((RGBColor) -> Void)?

    // MARK: - Properties

    private var cityImage: String = "" {
        didSet {
            onCityImageUpdate?(cityImage)
        }
    }
    private var cityName: String = "Default City Name" {
        didSet {
            onCityNameUpdate?(cityName)
        }
    }
    private var temperature: Int = 0 {
        didSet {
            let configured = "\(temperature)°"
            onTemperatureUpdate?(configured)
        }
    }
    private var description: String = "Default Description" {
        didSet {
            onDescriptionUpdate?(description)
        }
    }
    private var temperatureRange: (high: Int, low: Int) = (0, 0) {
        didSet {
            let configured = "\(temperatureRange.high)° / \(temperatureRange.low)°"
            onTemperatureRangeUpdate?(configured)
        }
    }
    private var rainPercentage: Int = 0 {
        didSet {
            let configured = "\(rainPercentage)%"
            onRainPercentageUpdate?(configured)
        }
    }
    private var windspeed: Int = 0 {
        didSet {
            let configured = "\(windspeed) MPH"
            onWindspeedUpdate?(configured)
        }
    }
    private var humidityPercentage: Double = 0 {
        didSet {
            let adjustedPercentage = humidityPercentage * 100
            let configured = "\(Int(adjustedPercentage))%"
            onHumidityPercentageUpdate?(configured)
        }
    }
    private var uvindex: Int = 0 {
        didSet {
            let configured = "\(uvindex)"
            onUvindexUpdate?(configured)
        }
    }
    private var message: String? {
        didSet {
            let defaultMessage = "This is the default message to the user."
            onMessageUpdate?(message ?? defaultMessage)
        }
    }

    private var backgroundColor: (red: Double, green: Double, blue: Double) = (red: 0, green: 113, blue: 188) {
        didSet {
            let color = (backgroundColor.red,
                         backgroundColor.green,
                         backgroundColor.blue)
            onBackgroundColorUpdate?(color)
        }
    }

    var model: WeatherDetailModel? {
        didSet {
            refresh()
        }
    }

    private func computeBackgroundColor(from timeOfDay: TimeOfDay) -> RGBColor {
        switch timeOfDay {
        case .morning, .noon, .afternoon, .evening:
            return (red: 0 / 256, green: 113 / 256, blue: 188 / 256)
        case .night:
            return (red: 9 / 256, green: 28 / 256, blue: 73 / 256)
        }
    }

    private func computeCityImage(from iconString: String) -> String {
        switch iconString {
        case "clear-day":
            return "clear-day-large"
        case "clear-night":
            return "clear-night-large"
        case "rain":
            return "rain-large"
        case "snow", "sleet":
            return "snow-large"
        case "wind", "fog":
            return "fog-large"
        case "cloudy":
            return "cloudy-large"
        case "partly-cloudy-day":
            return "partly-cloudy-day-large"
        case "partly-cloudy-night":
            return "partly-cloudy-night-large"
        default:
            return "clear-day-large"
        }
    }

    func refresh() {
        onAPILoading?(true)
        model?.fetchLocalWeather { [weak self] result in
            guard let strongSelf = self else { return }

            strongSelf.onAPILoading?(false)
            switch result {
            case .success(let value):
                strongSelf.cityImage = strongSelf.computeCityImage(from: value.icon)
                strongSelf.cityName = value.cityName
                strongSelf.temperature = value.temperature
                strongSelf.description = value.description
                strongSelf.temperatureRange = (value.highTemperature, value.lowTemperature)
                strongSelf.rainPercentage = value.rainPercentage
                strongSelf.windspeed = value.windspeed
                strongSelf.humidityPercentage = value.humidityPercentage
                strongSelf.uvindex = value.uvindex
                strongSelf.message = value.message

                let backgroundColor = strongSelf.computeBackgroundColor(from: value.timeOfDay)
                strongSelf.backgroundColor = backgroundColor
            case .failure(let uiError):
                switch uiError {
                case .networkError:
                    let errorToDisplay = "It looks like a network error occured. Try checking your internet connectivity!"
                    strongSelf.onAPIFailure?(errorToDisplay)
                case .malformedResponse:
                    let errorToDisplay = "The API is returning something we're not expecting. Take a look at the response payload!"
                    strongSelf.onAPIFailure?(errorToDisplay)
                }
            }
        }
    }
}
