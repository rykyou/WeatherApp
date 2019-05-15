//
//  UIView+Extension.swift
//  WeatherDetailExample
//
//  Created by Bajis, Thomas (CONT) on 5/5/19.
//  Copyright © 2019 Bajis, Thomas (CONT). All rights reserved.
//

import UIKit

extension UIView {
    func fillSubviewCompletely(_ subview: UIView) {
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: topAnchor),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor),
            subview.leftAnchor.constraint(equalTo: leftAnchor),
            subview.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}
