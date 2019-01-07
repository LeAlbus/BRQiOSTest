//
//  APITalker.swift
//  MovieList
//
//  Created by Joao Pedro Lopes Felix da Silva on 07/01/19.
//  Copyright © 2019 Joao Pedro Lopes Felix da Silva. All rights reserved.
//

import Foundation
import Alamofire

class APITalker{
    
    static let sharedInstance = APITalker()
    
    func requestMovieList(with title: String, successHandler: @escaping (_ successObject: [Movie]?) -> (), errorHandler: @escaping (_ error: NSError) -> ()){
    
        
        Alamofire.request("http://www.omdbapi.com/?apikey=250f96d0&s=The").responseJSON { response in
            print (response)
            
            let aMovie = Movie(newTitle: "Abreu", newGender: "AGender")
            let bMovie = Movie(newTitle: "Tadeu", newGender: "Another")
            let cMovie = Movie(newTitle: "Jubileu", newGender: "Last")
            
            successHandler([aMovie, bMovie, cMovie])
        }
        
    }

}
