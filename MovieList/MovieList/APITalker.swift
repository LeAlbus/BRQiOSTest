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
    
    func requestFrom(url: String, successHandler: @escaping (_ successObject: DecodableSearchResult?) -> (), errorHandler: @escaping (_ error: NSError?) -> ()){
    
        Alamofire.request(url).responseJSON { response in
            //print (response)

            switch response.result {
            case .success:
                do{
                    
                    let data = response.data
                    
                    let responseData = try JSONDecoder().decode(DecodableSearchResult.self, from: data!)

                    successHandler(responseData)
                    
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
