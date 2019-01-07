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
    
    func searchMovies(with title: String){
        
        APITalker.sharedInstance.requestMovieList(with: title, successHandler: { (movieList) in
            
            for movie in movieList!{
                print (movie)
            }
            
            }, errorHandler: { (error) in
                print (error)
            })
    }
}
