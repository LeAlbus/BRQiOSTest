//
//  SearchScreenViewController.swift
//  MovieList
//
//  Created by Joao Pedro Lopes Felix da Silva on 04/01/19.
//  Copyright © 2019 Joao Pedro Lopes Felix da Silva. All rights reserved.
//

import Foundation
import UIKit

class SearchScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultTableView: UITableView!
    
    let searchViewModel = MovieScreenVM()
    
    var currentList : [Movie] = []
    
    var searchedTitle: String = "" {
        didSet{
            searchViewModel.searchMovies(with: searchedTitle, firstRequest: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue")
        
        if let indexPath = resultTableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            let newID = self.searchViewModel.getMovieID(in: selectedRow)
 
            let detailVC = segue.destination as! DetailsViewController
            detailVC.movieID(id: newID)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultTableView.delegate = self
        self.resultTableView.dataSource = self
        
        self.searchBar.delegate = self
        
        self.searchViewModel.delegate = self
        
    }
    
    func didReceiveMovieListData(){
        
        if self.searchViewModel.currentList.count > 0{
        
            self.currentList = self.searchViewModel.currentList
            self.resultTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == currentList.count {
            searchViewModel.searchMovies(with: searchedTitle)
        }
    }
    
    func displayErrorMessage(error: String?){
        print (error ?? "nil")
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
       
        self.searchViewModel.clearList()
        
        self.searchedTitle = searchBar.text!
        self.searchBar.endEditing(true)
    }

}
