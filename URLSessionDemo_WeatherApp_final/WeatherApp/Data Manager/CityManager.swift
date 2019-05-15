//
//  CityManager.swift
//  WeatherApp
//
//  Created by Williamson, Folarin on 5/4/19.
//  Copyright © 2019 Williamson, Folarin. All rights reserved.
//

import Foundation

struct CityManager {
    static func fetchCity(_ city: String) -> City? {
        guard let path = Bundle.main.path(forResource: city, ofType: "json") else {
            return nil
        }
        
        let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        let city = try! JSONDecoder().decode(City.self, from: data)
        return city
    }
}
