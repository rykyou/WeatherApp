//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Williamson, Folarin on 5/2/19.
//  Copyright © 2019 Williamson, Folarin. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var currentTemperatureLabel: UILabel!
    @IBOutlet var icon: UIImageView!
    @IBOutlet var highLowTemperatureLabel: UILabel!
    @IBOutlet var precipProbabilityLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var container: UIView!
    
    func configure(_ data: WeatherData) {
        // styling
        backgroundColor = UIColor.init(red: 0/255.0, green: 113/255.0, blue: 188/255.0, alpha: 0.0)
        container.layer.cornerRadius = 8
        
        // bind data to view
        cityLabel.text = data.city
        countryLabel.text = data.country
        currentTemperatureLabel.text = "\(data.currentTemperature)°"
        icon.image = UIImage(named: "\(data.icon.rawValue)-small")
        highLowTemperatureLabel.text =  "\(data.temperatureHigh)°/\(data.temperatureLow)°"
        precipProbabilityLabel.text = "\(data.precipProbability)%"
        timeLabel.text = data.time
    }
}

