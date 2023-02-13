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
        XCTAssertNotNil(tagView)
    }
}
