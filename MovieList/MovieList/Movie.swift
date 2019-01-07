//
//  Movie.swift
//  MovieList
//
//  Created by Joao Pedro Lopes Felix da Silva on 07/01/19.
//  Copyright © 2019 Joao Pedro Lopes Felix da Silva. All rights reserved.
//

import Foundation

struct Movie{
    
    let title: String
    let gender: String
    
    init(newTitle: String, newGender: String) {
        self.title = newTitle
        self.gender = newGender
    }
}
