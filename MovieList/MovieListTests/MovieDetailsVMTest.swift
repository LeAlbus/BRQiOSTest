//
//  MovieDetailsVMTest.swift
//  MovieListTests
//
//  Created by Joao Pedro Lopes Felix da Silva on 08/01/19.
//  Copyright © 2019 Joao Pedro Lopes Felix da Silva. All rights reserved.
//

import XCTest
import UIKit
@testable import MovieList

class MovieDetailsVMTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
    }
    
    func testCacheSaving(){
        
        let testableMovieDetailsVM = MovieDetailsVM()
        
        let anImage = UIImage.init()
        
        testableMovieDetailsVM.cache(anImage, for: "AnTestableURL")
        
        XCTAssertNotNil(testableMovieDetailsVM.cachedImage(for: "AnTestableURL"))
        

    }
}
