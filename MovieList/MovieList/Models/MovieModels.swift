//
//  MovieModels.swift
//  MovieList
//
//  Created by Joao Pedro Lopes Felix da Silva on 08/01/19.
//  Copyright © 2019 Joao Pedro Lopes Felix da Silva. All rights reserved.
//

import Foundation

struct MovieDetails: Decodable{
    
    let title: String
    let released: String
    let genre: String
    let direction: String
    let cast: String
    let posterURL: String
    
    private enum CodingKeys: String, CodingKey{
        
        case title = "Title"
        case released = "Released"
        case genre = "Genre"
        case direction = "Director"
        case cast = "Actors"
        case posterURL = "Poster"
        
    }
}
