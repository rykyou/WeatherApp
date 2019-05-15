//
//  LoadingSpinnerViewController.swift
//  WeatherDetailExample
//
//  Created by Bajis, Thomas (CONT) on 5/5/19.
//  Copyright © 2019 Bajis, Thomas (CONT). All rights reserved.
//

import UIKit

class LoadingSpinnerViewController: UIViewController {

    // MARK: - Properties

    let spinner = UIActivityIndicatorView(style: .whiteLarge)

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        view.backgroundColor = .gray
        view.alpha = 0.9
        spinner.startAnimating()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)

        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spinner.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
