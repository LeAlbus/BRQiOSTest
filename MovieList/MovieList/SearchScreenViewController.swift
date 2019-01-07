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

class SearchScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultTableView: UITableView!
    
    let searchViewModel = MovieScreenVM()
    
    var searchedTitle: String = "" {
        didSet{
            searchViewModel.searchMovies(with: searchedTitle)
        }
    }
    
    var currentList : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultTableView.delegate = self
        self.resultTableView.dataSource = self
        
        self.searchBar.delegate = self
        
        self.searchViewModel.delegate = self
        
    }
    
    func didReceiveMovieListData(){
        
        if let newContent: [Movie] = self.searchViewModel.currentList{
        
            self.currentList.append(contentsOf: newContent)
            self.resultTableView.reloadData()
        }
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
        
        let subLine = "\(self.currentList[indexPath.row].type) / \(self.currentList[indexPath.row].year)"
        cell.detailTextLabel?.text = subLine
        
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchedTitle = searchBar.text!
        self.searchBar.endEditing(true)
    }
  
}
