//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Williamson, Folarin on 5/1/19.
//  Copyright © 2019 Williamson, Folarin. All rights reserved.
//  Starter

import UIKit
import MapKit

class WeatherViewController: UIViewController {
    @IBOutlet var iconView: UIImageView!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var temperature: UILabel!
    
    var city = CityManager.fetchCity("LosAngeles")
    let apiKey = "ccedf955fea93588a2c2489a803e8bc2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let city = city else { return }
        
        // Call Dark Sky API HERE
        
    }
}

//let weatherForecast = WeatherDataManager.forecast(data, city: city)
//DispatchQueue.main.async {[weak self] in
//    self?.iconView.image = UIImage(named: "\(weatherForecast.icon.rawValue)-large")
//    self?.locationLabel.text = "\(weatherForecast.city), \(weatherForecast.state)"
//    self?.temperature.text = "\(weatherForecast.currentTemperature)°"
//}

