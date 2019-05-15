//
//  Result.swift
//  WeatherDetailExample
//
//  Created by Bajis, Thomas (CONT) on 5/3/19.
//  Copyright © 2019 Bajis, Thomas (CONT). All rights reserved.
//

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}

enum NoError: Error {}
