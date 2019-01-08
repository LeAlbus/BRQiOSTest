//
//  Movie.swift
//  MovieList
//
//  Created by Joao Pedro Lopes Felix da Silva on 07/01/19.
//  Copyright © 2019 Joao Pedro Lopes Felix da Silva. All rights reserved.
//

import Foundation

//struct Movie{
//    
//    let title: String
//    let year: String
//    let ID: String
//    let type: String
//    let posterURL: String
//
//    init(newTitle: String, newYear: String, newID: String, newType: String, newPosterURL: String ) {
//        self.title = newTitle
//        self.year = newYear
//        self.ID = newID
//        self.type = newType
//        self.posterURL = newPosterURL
//    }
//}

struct Movie: Decodable{

    let title: String
    let year: String
    let ID: String
    let type: String
    let posterURL: String
    
    private enum CodingKeys: String, CodingKey{
        
        case title = "Title"
        case year = "Year"
        case ID = "imdbID"
        case type = "Type"
        case posterURL = "Poster"
    }
}

struct SearchResult{
    
    let movieList: [Movie]
    let totalResults: Int
    
    init(list: [Movie], totalRes: Int){
        self.movieList = list
        self.totalResults = totalRes
    }
    
}
