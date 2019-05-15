//
//  UIViewController+Extension.swift
//  WeatherDetailExample
//
//  Created by Bajis, Thomas (CONT) on 5/5/19.
//  Copyright © 2019 Bajis, Thomas (CONT). All rights reserved.
//

import UIKit

extension UIViewController {
    func add(_ childViewController: UIViewController) {
        addChild(childViewController)
        childViewController.didMove(toParent: self)
    }

    func remove(_ childViewController: UIViewController) {
        childViewController.willMove(toParent: nil)
        childViewController.removeFromParent()
    }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "Oops!",
                                      message: message,
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Dismiss", style: .default)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
}
