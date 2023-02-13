//
//  TestViewModels.swift
//  CineAppTests
//
//  Created by Carlos on 12/2/23.
//

import XCTest
@testable import CineApp

class TestViewModels: XCTestCase {
    
    func testMovieListViewModel() throws {
        let movieListViewModel = MovieListViewModel()
        
        let title = movieListViewModel.title
        let tags = movieListViewModel.tags

        XCTAssertEqual(tags.count > 0, true)
        XCTAssertNotNil(title)
    }
    
    func testGroupedMoviesViewModel() throws {
        let groupedMoviesViewModel = GroupedMoviesViewModel()
        
        var movies: [Movie] = []
        let data = DataManager()
        movies = data.getAllMoviesFromShowsByGenre()
        
        groupedMoviesViewModel.movies = movies
        
        groupedMoviesViewModel.groupMoviesBy(filter: .AllMovies)
        groupedMoviesViewModel.groupMoviesBy(filter: .European)
        
        XCTAssertEqual(groupedMoviesViewModel.movies.count > 0, true)
        XCTAssertEqual(groupedMoviesViewModel.groupMovies.count > 0, true)
    }
}
