//
//  FavoriteMoviesController.swift
//  TableViewDemo
//
//  Created by Williamson, Folarin on 5/11/19.
//  Copyright © 2019 Williamson, Folarin. All rights reserved.
//

import UIKit

class FavoriteMoviesController: UIViewController {
    var movieTitles = ["City of God", "Scarface", "The Godfather", "Paid in Full"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FavoriteMoviesController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movie = movieTitles[indexPath.row]
        cell.textLabel?.text = movie
        return cell
    }
}

