//
//  APITalker.swift
//  MovieList
//
//  Created by Joao Pedro Lopes Felix da Silva on 07/01/19.
//  Copyright © 2019 Joao Pedro Lopes Felix da Silva. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APITalker{
    
    static let sharedInstance = APITalker()
    
    func requestFrom(url: String, successHandler: @escaping (_ successObject: SearchResult?) -> (), errorHandler: @escaping (_ error: NSError?) -> ()){
    
        Alamofire.request(url).responseJSON { response in
            if((response.result.value) != nil) {
                
                print (response)
                
                let swiftyJsonResponse = JSON(response.result.value!)
                
                switch response.result {
                case .success:
                    do{
                        
                        guard let totalRes = Int(swiftyJsonResponse["totalResults"].stringValue) else {return}
                        
                        let results = swiftyJsonResponse["Search"].arrayValue
                        
                        var decodedResults: [Movie] = []
                        
                        for result in results{
                            
                            let newRes = try JSONDecoder().decode(Movie.self, from: result.rawData())
                            decodedResults.append(newRes)
                        }
                        
                        let searchRes: SearchResult = SearchResult(list: decodedResults, totalRes: totalRes)

                        successHandler(searchRes)
                        
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
    
    
    func requestMovieData(from url: String, successHandler: @escaping (_ successObject: MovieDetails?) -> (), errorHandler: @escaping (_ error: NSError?) -> ()){
        
        Alamofire.request(url).responseJSON { response in
            if((response.result.value) != nil) {
                
                print (response)
            
                switch response.result {
                case .success:
                    do{
                        
                        let movieDataDecoded: MovieDetails = try JSONDecoder().decode(MovieDetails.self, from: response.data!)
                        
                        successHandler(movieDataDecoded)
                        
                    } catch let error{
                        
                        print ("Error while parsing response")
                        print(error)
                        
                        successHandler(nil)
                        errorHandler(error as NSError)
                    }
                case .failure(_):
                    
                    print ("Failed to get movie data from url")
                    
                    successHandler(nil)
                    errorHandler(nil)
                }
                
            }
            
        }
        
    }

}
