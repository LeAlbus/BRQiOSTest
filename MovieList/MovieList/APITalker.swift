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
    
    func requestMovieList(with title: String, successHandler: @escaping (_ successObject: [Movie]?) -> (), errorHandler: @escaping (_ error: NSError?) -> ()){
    
        
        Alamofire.request("http://www.omdbapi.com/?apikey=250f96d0&s=Spider").responseJSON { response in
           
            print (response)
   
            switch response.result {
            case .success:
                do{
                    
                    let data = response.data
                    
                    let responseList = try JSONDecoder().decode(DecodableSearchResult.self, from: data!)

                    successHandler(responseList.movieList)
                    
                } catch let error{
                    
                    print ("Error while parsing response")
                    print(error)
                    
                    successHandler(nil)
                    errorHandler(error as NSError)
                }
            case .failure(_):
                
                print ("Failed to get movie list from url")
                
                successHandler(nil)
                errorHandler(nil)
            }
        }
        
    }

}
