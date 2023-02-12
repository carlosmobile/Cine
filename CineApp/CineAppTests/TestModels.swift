//
//  TestModels.swift
//  CineAppTests
//
//  Created by Carlos on 12/2/23.
//

import XCTest
@testable import CineApp

class TestModels: XCTestCase {
    
    func testDataManagerAndModels() throws {
        
        //DataManager
        let dataManager = DataManager()
        
        let showsByGenre = dataManager.showsByGenre
        let movies = dataManager.getAllMoviesFromShowsByGenre()
        
        //Model ShowsByGenre
        XCTAssertEqual(showsByGenre.count > 0, true)
        XCTAssertNotNil(showsByGenre.first?.totalCount)
        XCTAssertNotNil(showsByGenre.first?.genre)
        XCTAssertNotNil(showsByGenre.first?.movies)
        
        //Model Movie
        XCTAssertEqual(movies.count > 0, true)
        XCTAssertNotNil(movies.first?.id)
        XCTAssertNotNil(movies.first?.title)
        XCTAssertNotNil(movies.first?.directors)
        XCTAssertNotNil(movies.first?.actors)
        XCTAssertNotNil(movies.first?.writers)
        XCTAssertNotNil(movies.first?.categories)
        XCTAssertNotNil(movies.first?.year)
        XCTAssertNotNil(movies.first?.score)
        XCTAssertNotNil(movies.first?.synopsis)
        XCTAssertNotNil(movies.first?.moviePictures)
        XCTAssertNotNil(movies.first?.length)
        XCTAssertNotNil(movies.first?.country)
        XCTAssertNotNil(movies.first?.ageCode)
    }
}
