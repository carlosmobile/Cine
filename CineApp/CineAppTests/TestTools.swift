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
}
