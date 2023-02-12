//
//  TestCommon.swift
//  CineAppTests
//
//  Created by Carlos on 12/2/23.
//

import XCTest
@testable import CineApp

class TestCommon: XCTestCase {
    
    func testTagView() throws {
        
        let tagView = TagView()
        var tagViewItemSelected = TagViewItem(title: "mockTitle", isSelected: false)
        let tagViewItemUnSelected = TagViewItem(title: "mockTitleFalse", isSelected: false)
        
        tagViewItemSelected.title = "mockTitle"
        tagViewItemSelected.isSelected = true
        
        XCTAssertNotNil(tagView)
        XCTAssertEqual(tagViewItemSelected.title, "mockTitle")
        XCTAssertEqual(tagViewItemUnSelected.title, "mockTitleFalse")
        XCTAssertEqual(tagViewItemSelected.isSelected, true)
        XCTAssertEqual(tagViewItemUnSelected.isSelected, false)
    }
}
