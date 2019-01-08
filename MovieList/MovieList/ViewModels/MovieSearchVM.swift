//
//  MovieSearchVM.swift
//  MovieList
//
//  Created by Joao Pedro Lopes Felix da Silva on 07/01/19.
//  Copyright © 2019 Joao Pedro Lopes Felix da Silva. All rights reserved.
//

import Foundation
import Alamofire

class MovieScreenVM{
    
    var currentList: [Movie] = []
    var delegate: SearchScreenViewController?
    
    var resultPages = 1
    var allMoviesRetrieved: Bool = false
    
    var currentlyRequesting: Bool = false
    
    func clearList(){
        self.currentList.removeAll()
        self.resultPages = 1
        self.allMoviesRetrieved = false
        self.currentlyRequesting = false
    }
    
    func getMovieID(in position: Int) -> String{
        
        if !self.currentList.isEmpty{
            if position < currentList.count-1 {
                return currentList[position].ID
            }
            
            return currentList.last!.ID
        }
        return ""
    }
    
    func searchMovies(with title: String, firstRequest: Bool = false){
        
        if !self.currentlyRequesting && !self.allMoviesRetrieved{
            self.currentlyRequesting = true
            
            APITalker.sharedInstance.requestFrom(url: "http://www.omdbapi.com/?apikey=250f96d0&s=\(title)&page=\(resultPages)", successHandler: { (response) in
                
                if let responseData = response{
                    let newMovies = responseData.movieList
                    self.currentList.append(contentsOf: newMovies)
                    self.resultPages += 1
                    
                    if self.currentList.count >= responseData.totalResults{
                        self.allMoviesRetrieved = true
                    }

                    if firstRequest{
                        self.searchMovies(with: title)
                    }
                    self.delegate?.didReceiveMovieListData()
                } else {
                    
                    self.delegate?.displayErrorMessage(error: nil)
                }
                
                self.currentlyRequesting = false
                
            }, errorHandler: { (error) in
                print (error as Any)
                self.currentlyRequesting = false

            })
        }
    }
}
