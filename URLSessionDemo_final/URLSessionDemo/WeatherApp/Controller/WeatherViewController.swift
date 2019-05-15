//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Williamson, Folarin on 5/1/19.
//  Copyright © 2019 Williamson, Folarin. All rights reserved.
//

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
        
        guard let url = URL(string: "https://api.darksky.net/forecast/\(apiKey)/\(city.latitude),\(city.longitude)?exclude=hourly,minutely,flags") else {
            return print("URL is invalid")
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    print(httpResponse)
                }
            }
            
            guard let data = data else {
                return print("Data was not returned")
            }
            
            let weatherForecast = WeatherDataManager.forecast(data, city: city)
            
            DispatchQueue.main.async {[weak self] in
                self?.iconView.image = UIImage(named: "\(weatherForecast.icon.rawValue)-large")
                self?.locationLabel.text = "\(weatherForecast.city), \(weatherForecast.state)"
                self?.temperature.text = "\(weatherForecast.currentTemperature)°"
            }
        }
        
        task.resume()
    }
}
