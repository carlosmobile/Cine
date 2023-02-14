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
        XCTAssertNotNil(movies.first?.year)
        XCTAssertNotNil(movies.first?.score)
        XCTAssertNotNil(movies.first?.synopsis)
        XCTAssertNotNil(movies.first?.moviePictures)
        XCTAssertNotNil(movies.first?.length)
        XCTAssertNotNil(movies.first?.country)
        
        //Model TagItem
        var tagViewItemSelected = TagItem(title: "mockTitle", isSelected: false, filter: TagMoviesFilterBy.AllMovies)
        let tagViewItemUnSelected = TagItem(title: "mockTitleFalse", isSelected: false, filter: TagMoviesFilterBy.Spain)
        
        tagViewItemSelected.title = "mockTitle"
        tagViewItemSelected.isSelected = true
        
        XCTAssertEqual(tagViewItemSelected.title, "mockTitle")
        XCTAssertEqual(tagViewItemUnSelected.title, "mockTitleFalse")
        XCTAssertEqual(tagViewItemSelected.isSelected, true)
        XCTAssertEqual(tagViewItemUnSelected.isSelected, false)
        
        //Enum TagMoviesFilterBy
        XCTAssertEqual(TagMoviesFilterBy.AllMovies.title, "A-Z")
        XCTAssertEqual(TagMoviesFilterBy.European.title, "Europeo")
        XCTAssertEqual(TagMoviesFilterBy.EEUU.title, "Estados Unidos")
        XCTAssertEqual(TagMoviesFilterBy.American.title, "Americano")
        XCTAssertEqual(TagMoviesFilterBy.Asian.title, "Asiático")
        XCTAssertEqual(TagMoviesFilterBy.Spain.title, "Español")
        XCTAssertEqual(TagMoviesFilterBy.Australian.title, "Australiano")
        
        let allRegionCountries = TagMoviesFilterBy.AllMovies.getRegionFromMoviesType()
        let europeanRegionCountries = TagMoviesFilterBy.European.getRegionFromMoviesType()
        let eeuuRegionCountries = TagMoviesFilterBy.EEUU.getRegionFromMoviesType()
        let americanRegionCountries = TagMoviesFilterBy.American.getRegionFromMoviesType()
        let asianRegionCountries = TagMoviesFilterBy.Asian.getRegionFromMoviesType()
        let spainRegionCountries = TagMoviesFilterBy.Spain.getRegionFromMoviesType()
        let australianRegionCountries = TagMoviesFilterBy.Australian.getRegionFromMoviesType()
        
        XCTAssertEqual(allRegionCountries.count > 0, true)
        XCTAssertEqual(europeanRegionCountries.count > 0, true)
        XCTAssertEqual(eeuuRegionCountries.count > 0, true)
        XCTAssertEqual(americanRegionCountries.count > 0, true)
        XCTAssertEqual(asianRegionCountries.count > 0, true)
        XCTAssertEqual(spainRegionCountries.count > 0, true)
        XCTAssertEqual(australianRegionCountries.count > 0, true)
        
    }
}
