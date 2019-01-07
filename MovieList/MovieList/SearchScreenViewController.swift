//
//  SearchScreenViewController.swift
//  MovieList
//
//  Created by Joao Pedro Lopes Felix da Silva on 04/01/19.
//  Copyright © 2019 Joao Pedro Lopes Felix da Silva. All rights reserved.
//

import Foundation
//import PureLayout
import UIKit

class SearchScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultTableView: UITableView!
    
    var currentList = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultTableView.delegate = self
        self.resultTableView.dataSource = self
        
        self.currentList = [ Movie(newTitle: "movie Title A", newGender: "Horror"),
                             Movie(newTitle: "movie Title B", newGender: "Action"),
                             Movie(newTitle: "movie Title C", newGender: "Drama"),
                             Movie(newTitle: "movie Title D", newGender: "Action"),
                             Movie(newTitle: "movie Title E", newGender: "Drama"),
                             Movie(newTitle: "movie Title F", newGender: "Horror"),
                             Movie(newTitle: "movie Title G", newGender: "Horror"),
                             Movie(newTitle: "movie Title H", newGender: "Drama"),
                             Movie(newTitle: "movie Title I", newGender: "Romance"),
                             Movie(newTitle: "movie Title J", newGender: "Action")]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectionIndexPath = self.resultTableView.indexPathForSelectedRow {
            self.resultTableView.deselectRow(at: selectionIndexPath, animated: animated)
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTitleCell", for: indexPath)

        cell.textLabel?.text = self.currentList[indexPath.row].title
        cell.detailTextLabel?.text = self.currentList[indexPath.row].gender
        return cell
    }
}
