//
//  WeatherDetailViewController.swift
//  SpaceTools
//
//  Created by Bajis, Thomas (CONT) on 5/1/19.
//  Copyright © 2019 Bajis, Thomas (CONT). All rights reserved.
//

import UIKit

public class WeatherDetailViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempRangeLabel: UILabel!
    @IBOutlet weak var rainPercentageLabel: UILabel!

    @IBOutlet weak var windspeedValueLabel: UILabel!
    @IBOutlet weak var humidityValueLabel: UILabel!
    @IBOutlet weak var uvindexValueLabel: UILabel!

    @IBOutlet weak var messageLabel: UILabel!

    // MARK: - Properties

    private var viewModel: WeatherDetailViewModel?
    private let spinnerController = LoadingSpinnerViewController()

    // MARK: - Lifecycle

    override public func viewDidLoad() {
        super.viewDidLoad()

        // Show Loading Indicator
        showLoadingIndicator()

        // View - ViewModel Bindings
        
        viewModel?.onCityImageUpdate = { [weak self] (cityImage) in
            self?.cityImageView.image = UIImage(named: cityImage)
        }
        viewModel?.onCityNameUpdate = { [weak self] (cityName) in
            self?.cityLabel.text = cityName
        }
        viewModel?.onTemperatureUpdate = { [weak self] (temperature) in
            self?.temperatureLabel.text = temperature
        }
        viewModel?.onDescriptionUpdate = { [weak self] (description) in
            self?.descriptionLabel.text = description
        }
        viewModel?.onTemperatureRangeUpdate = { [weak self] (temperatureRange) in
            self?.tempRangeLabel.text = temperatureRange
        }
        viewModel?.onRainPercentageUpdate = { [weak self] (rainPercentage) in
            self?.rainPercentageLabel.text = rainPercentage
        }
        viewModel?.onWindspeedUpdate = { [weak self] (windspeed) in
            self?.windspeedValueLabel.text = windspeed
        }
        viewModel?.onHumidityPercentageUpdate = { [weak self] (humidityPercentage) in
            self?.humidityValueLabel.text = humidityPercentage
        }
        viewModel?.onUvindexUpdate = { [weak self] (uvindex) in
            self?.uvindexValueLabel.text = uvindex
        }
        viewModel?.onMessageUpdate = { [weak self] (message) in
            self?.messageLabel.text = message
        }
        viewModel?.onBackgroundColorUpdate = { [weak self] (colorComponents) in
            let color = UIColor(red: CGFloat(colorComponents.red),
                                green: CGFloat(colorComponents.green),
                                blue: CGFloat(colorComponents.blue),
                                alpha: 1)
            self?.view.backgroundColor = color
        }
        viewModel?.onAPIFailure = { [weak self] (message) in
            self?.showError(message)
        }
        viewModel?.onAPILoading = { [weak self] (isLoading) in
            self?.showLoadingIndicator(isLoading)
        }
    }

    // MARK: - IBActions

    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        showLoadingIndicator()
        viewModel?.refresh()
    }


    private func showLoadingIndicator(_ isLoading: Bool = true) {
        if isLoading {
            add(spinnerController)
            view.addSubview(spinnerController.view)
            view.fillSubviewCompletely(spinnerController.view)
        } else {
            remove(spinnerController)
            spinnerController.view.removeFromSuperview()
        }
    }

    // MARK: - Utility Functions

    class func instantiate(viewModel: WeatherDetailViewModel) -> WeatherDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "WeatherDetailViewController") as! WeatherDetailViewController
        viewController.viewModel = viewModel

        return viewController
    }
}
