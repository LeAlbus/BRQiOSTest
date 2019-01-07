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
    
    var currentList: [Movie]?
    var delegate: SearchScreenViewController?
    
    func searchMovies(with title: String){
        
        APITalker.sharedInstance.requestFrom(url: "http://www.omdbapi.com/?apikey=250f96d0&s=\(title)", successHandler: { (movieList) in
            
            self.currentList = movieList
            self.delegate?.didReceiveMovieListData()

//            for movie in movieList!{
//                print (movie)
//            }
            
        }, errorHandler: { (error) in
            print (error as Any)
        })
    }
}
