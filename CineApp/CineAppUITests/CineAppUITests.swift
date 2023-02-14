//
//  CineAppUITests.swift
//  CineAppUITests
//
//  Created by Carlos on 11/2/23.
//

import XCTest
@testable import CineApp

final class CineAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testUICineApp() throws {
        let app = XCUIApplication()
            app.launchArguments = ["UITests"]
        
        app.launch()
        
        let timeout: Double = 2
        
        for i in 0...(app.staticTexts.matching(identifier: "tagButton").count) {
            print("NUMERO DE TAG: \(i)")
            let moviesTag = app.staticTexts.element(boundBy: i)
            XCTAssertTrue(moviesTag.waitForExistence(timeout: timeout))
            moviesTag.tap()
            app.swipeDown()
            app.swipeUp()
            app.buttons["imageButton"].firstMatch.tap()
            app.swipeDown()
            app.swipeUp()
            app.buttons["closeDetailButton"].tap()
        }

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
