//
//  TestTools.swift
//  CineAppTests
//
//  Created by Carlos on 12/2/23.
//

import XCTest
@testable import CineApp

class TestTools: XCTestCase {
    
    func testTargetDevice() throws {
        
        let iPadTargetDevice: TargetDevice = .iPad
        let iPhoneTargetDevice: TargetDevice = .iPhone
        let iWatchTargetDevice: TargetDevice = .iWatch
        let nativeMacTargetDevice: TargetDevice = .nativeMac

        let iPadDevice = TargetDevice.currentDevice("iPad")
        let iphoneDevice = TargetDevice.currentDevice("iPhone")
        let watchOSDevice = TargetDevice.currentDevice("watchOS")
        let nativeMacDevice = TargetDevice.currentDevice("nativeMac")
        let emptyDevice = TargetDevice.currentDevice("")

        XCTAssertEqual(iPadDevice, iPadTargetDevice)
        XCTAssertEqual(iphoneDevice, iPhoneTargetDevice)
        XCTAssertEqual(watchOSDevice, iWatchTargetDevice)
        XCTAssertEqual(nativeMacDevice, nativeMacTargetDevice)
        XCTAssertNotNil(emptyDevice)
    }
    
    func testGridColumns() throws {
        
        let gridColumns = GridColumns()
        XCTAssertEqual(gridColumns.iPhoneColumns, 3)
        XCTAssertEqual(gridColumns.iPadColumns, 5)
        
        let gridEmpty = gridColumns.getFitDeviceNumberColumns()
        let gridIpad = gridColumns.getFitDeviceNumberColumns("iPad")
        let gridIphone = gridColumns.getFitDeviceNumberColumns("iPhone")
        let gridWatchOS = gridColumns.getFitDeviceNumberColumns("watchOS")
        let gridNativeMac = gridColumns.getFitDeviceNumberColumns("nativeMac")
        
        XCTAssertEqual(gridEmpty.count, 3)
        XCTAssertEqual(gridIpad.count, 5)
        XCTAssertEqual(gridIphone.count, 3)
        XCTAssertEqual(gridWatchOS.count, 3)
        XCTAssertEqual(gridNativeMac.count, 3)
    }
    
    func testTagType() throws {
        
        let tagType = TagType()
        
        XCTAssertNotNil(tagType.getTagTypeView(tagType: TagMoviesFilterBy.AllMovies, viewModel: MovieListViewModel()))
        XCTAssertNotNil(tagType.getTagTypeView(tagType: TagMoviesFilterBy.European, viewModel: MovieListViewModel()))
    }
}
