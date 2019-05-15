//
//  FavoriteMoviesController.swift
//  TableViewDemo
//
//  Created by Williamson, Folarin on 5/11/19.
//  Copyright © 2019 Williamson, Folarin. All rights reserved.
//

import UIKit

class FavoriteMoviesController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var movieTitles = ["Paid in Full", "The Godfather", "City of God", "Scarface", "Pulp Fiction"]
    let cellID = "movieCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorite Movies"
    }
}

extension FavoriteMoviesController: UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let title = movieTitles[indexPath.row]
        cell.textLabel?.text = title
        return cell
    }
}

