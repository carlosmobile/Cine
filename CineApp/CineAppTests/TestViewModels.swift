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
        
        let columnsGrid = movieListViewModel.columnsGrid
        let title = movieListViewModel.title
        let tags = movieListViewModel.tags
        let iPadColumns = movieListViewModel.iPadColumns
        let iPhoneColumns = movieListViewModel.iPhoneColumns
        
        XCTAssertEqual(columnsGrid.count > 0, true)
        XCTAssertEqual(tags.count > 0, true)
        XCTAssertNotNil(title)
        XCTAssertEqual(iPadColumns, 5)
        XCTAssertEqual(iPhoneColumns, 3)
    }
}
