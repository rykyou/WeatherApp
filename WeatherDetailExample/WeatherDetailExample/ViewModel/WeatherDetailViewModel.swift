//
//  WeatherDetailViewModel.swift
//  WeatherDetailExample
//
//  Created by Bajis, Thomas (CONT) on 5/3/19.
//  Copyright © 2019 Bajis, Thomas (CONT). All rights reserved.
//

typealias RGBColor = (red: Double, green: Double, blue: Double)

protocol WeatherDetailViewModel {
    var onCityImageUpdate: ((String) -> Void)? { get set }
    var onCityNameUpdate: ((String) -> Void)? { get set }
    var onTemperatureUpdate: ((String) -> Void)? { get set }
    var onDescriptionUpdate: ((String) -> Void)? { get set }
    var onTemperatureRangeUpdate: ((String) -> Void)? { get set }
    var onRainPercentageUpdate: ((String) -> Void)? { get set }
    var onWindspeedUpdate: ((String) -> Void)? { get set }
    var onHumidityPercentageUpdate: ((String) -> Void)? { get set }
    var onUvindexUpdate: ((String) -> Void)? { get set }
    var onMessageUpdate: ((String) -> Void)? { get set }
    var onBackgroundColorUpdate: ((RGBColor) -> Void)? { get set }
    var onAPIFailure: ((String) -> Void)? { get set }
    var onAPILoading: ((Bool) -> Void)? { get set }

    func refresh()
}
