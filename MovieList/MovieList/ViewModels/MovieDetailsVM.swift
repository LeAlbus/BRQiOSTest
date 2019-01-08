//
//  MovieDetailsVM.swift
//  MovieList
//
//  Created by Joao Pedro Lopes Felix da Silva on 08/01/19.
//  Copyright © 2019 Joao Pedro Lopes Felix da Silva. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON

class MovieDetailsVM{
    
    var delegate: DetailsViewController?

    var movieData: MovieDetails?
    var movieID: String = ""
    
    func searchMovie(){
        APITalker.sharedInstance.requestMovieData(from: "http://www.omdbapi.com/?apikey=250f96d0&i=\(movieID)", successHandler: { (response) in
        
             if let responseData = response{
             
                self.movieData = responseData
                self.delegate?.setupView(with: self.movieData!)
                
             } else {
                
                self.delegate?.displayErrorMessage(error: nil)
            }
            
        }, errorHandler: { (error) in
            print (error as Any)
        })
    }
    

}
