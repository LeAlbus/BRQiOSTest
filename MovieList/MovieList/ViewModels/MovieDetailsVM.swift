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
    
    let cacheImage = AutoPurgingImageCache(memoryCapacity: (100*1024*1024), preferredMemoryUsageAfterPurge: (75*1024*1024))
    
    
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
    
    func getMovieImage(from url: String){
        
        if let poster = self.cachedImage(for: url) {
            self.delegate?.setPosterImage(poster)
        } else {
        
            APITalker.sharedInstance.retrievePoster(from: url, successHandler: { (image) in
                
                if let poster = image{
                    
                    self.cache(poster, for: url)
                    self.delegate?.setPosterImage(poster)
                    
                } else {
                    self.delegate?.setPosterImage(nil)
                }
            })
        }
    }
    
    func cache(_ image: Image, for url: String) {
        cacheImage.add(image, withIdentifier: url)
    }
    
    func cachedImage(for url: String) -> Image? {
        return cacheImage.image(withIdentifier: url)
    }
    
}
