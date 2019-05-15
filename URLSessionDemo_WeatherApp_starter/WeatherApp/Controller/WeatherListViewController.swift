//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by Williamson, Folarin on 5/1/19.
//  Copyright © 2019 Williamson, Folarin. All rights reserved.
// STARTER

import UIKit
import MapKit

class WeatherListViewController: UIViewController {
    // TO DO: wire up your table view found in Main.storyboard

    
    public static let weatherCellID = String(describing: WeatherCell.self)
    public static let weatherListSectionHeaderID = String(describing: WeatherListSectionHeaderView.self)
    
    var dataSource: WeatherListDataSource = WeatherListDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headerNib = UINib(nibName: String(describing: WeatherListSectionHeaderView.self), bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: WeatherListViewController.weatherListSectionHeaderID)
        
        // TO DO: register a reuse identifier for your cell
        let cellNib = UINib(nibName: String(describing: WeatherCell.self), bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "")
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
        dataSource.handler = {[weak self] in
            DispatchQueue.main.async() {
                self?.tableView.reloadData()
            }
        }
        
        // TO DO: insert the name of a city found in the Data+Assets folder
        // Note: this line of code initiates the network call to the Dark Sky API
        // Duplicate this code to fetch data for more cities
        dataSource.makeAPICall(cityName: "")
    }
}

