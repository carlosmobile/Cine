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
    
    func testCloseButtonView() throws {
        let closeButtonView = CloseButtonView(action: action, tintColor: nil)
        XCTAssertNotNil(closeButtonView)
    }
    
    func testMultiImageItemView() throws {
        var multiImageItemView = MultiImageItemView(fullItemCallback: action)
        multiImageItemView.targetDevice = .iPad
        
        XCTAssertNotNil(multiImageItemView)
        XCTAssertEqual(multiImageItemView.targetDevice, .iPad)
        XCTAssertEqual(multiImageItemView.setWidthSizeToMultiImageCard() > 0, true)
    }
    
    func action() {
        //mock button
    }
}
