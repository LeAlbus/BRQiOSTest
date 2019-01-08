//
//  MovieSearchVMTests.swift
//  MovieListTests
//
//  Created by Joao Pedro Lopes Felix da Silva on 08/01/19.
//  Copyright © 2019 Joao Pedro Lopes Felix da Silva. All rights reserved.
//

import XCTest
@testable import MovieList

class MovieSearchVMTest: XCTestCase {
    
    var movieMockArray: [Movie]?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        movieMockArray = []
        
        let mockSize = 5
        var insertions = 0
        
        repeat {
            let anID = "ID\(insertions)"
            let aMovie = Movie(title: "aMovie", year: "1900", ID: anID, type: "Movie", posterURL: "http://url.com")
            
            movieMockArray?.append(aMovie)
            insertions += 1
        } while (insertions < mockSize)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        movieMockArray = nil
    }
    
    func testClearListAllAltered(){
        
        let testableMovieScreemVM = MovieScreenVM()
        
        testableMovieScreemVM.currentList = self.movieMockArray!
        testableMovieScreemVM.allMoviesRetrieved = true
        testableMovieScreemVM.currentlyRequesting = true
        testableMovieScreemVM.resultPages = 999
        
        testableMovieScreemVM.clearList()
        
        XCTAssertFalse(testableMovieScreemVM.allMoviesRetrieved, "allMoviesRetrieved variable must be false when clearing list")
        XCTAssertFalse(testableMovieScreemVM.currentlyRequesting, "currentlyRequesting variable must be false when clearing list")
        
        XCTAssertEqual(1, testableMovieScreemVM.resultPages, "Result page must be set to 1 when clearing list")
        XCTAssertEqual(0, testableMovieScreemVM.currentList.count, "movie list must be empty when clearing list")
    }
    
    func testClearListAllDefault(){
        
        let testableMovieScreemVM = MovieScreenVM()
        
        testableMovieScreemVM.currentList = []
        testableMovieScreemVM.allMoviesRetrieved = false
        testableMovieScreemVM.currentlyRequesting = false
        testableMovieScreemVM.resultPages = 1
        
        testableMovieScreemVM.clearList()
        
        XCTAssertFalse(testableMovieScreemVM.allMoviesRetrieved, "allMoviesRetrieved variable must be false when clearing list")
        XCTAssertFalse(testableMovieScreemVM.currentlyRequesting, "currentlyRequesting variable must be false when clearing list")
        
        XCTAssertEqual(1, testableMovieScreemVM.resultPages, "Result page must be set to 1 when clearing list")
        XCTAssertEqual(0, testableMovieScreemVM.currentList.count, "movie list must be empty when clearing list")
    }
    
    func testGetMovieID(){
        
        let testableMovieScreemVM = MovieScreenVM()
        testableMovieScreemVM.currentList = self.movieMockArray!
        
        let testableID = testableMovieScreemVM.getMovieID(in: 3)
        
        XCTAssertEqual("ID3", testableID, "Should return id from correct position")
    }
    
    func testGetMovieIDOutOFRange(){
        
        let testableMovieScreemVM = MovieScreenVM()
        testableMovieScreemVM.currentList = self.movieMockArray!
        
        let testableID = testableMovieScreemVM.getMovieID(in: 99999)
        
        XCTAssertEqual("ID4", testableID, "Should return id from correct position")
    }
    
    func testGetMovieIDEmptyList(){
        
        let testableMovieScreemVM = MovieScreenVM()
        testableMovieScreemVM.currentList = []
        
        let testableID = testableMovieScreemVM.getMovieID(in: 2)
        
        XCTAssertEqual("", testableID, "Should return empty string")
    }
}
