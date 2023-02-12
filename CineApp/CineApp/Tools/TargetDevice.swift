//
//  TargetDevice.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

import Foundation
import UIKit

public enum TargetDevice {
    case nativeMac
    case iPad
    case iPhone
    case iWatch
    
    public static func currentDevice(_ mockDeviceToTests: String? = "") -> Self {

        var currentDeviceModel: String {
            get {
                return _currentDeviceModel
            }
            set {
                if let mockDevice = mockDeviceToTests, mockDevice.isEmpty {
                    _currentDeviceModel = UIDevice.current.model
                }
                if let mockDevice = mockDeviceToTests, !mockDevice.isEmpty {
                    _currentDeviceModel = mockDevice
                }
            }
        }
        
        var _currentDeviceModel = ""
        currentDeviceModel = ""
        
        #if targetEnvironment(macCatalyst)
        currentDeviceModel = "nativeMac"
        #elseif os(watchOS)
        currentDeviceModel = "watchOS"
        #endif
        
        if _currentDeviceModel.starts(with: "iPhone") {
            return .iPhone
        }
        if _currentDeviceModel.starts(with: "iPad") {
            return .iPad
        }
        if _currentDeviceModel.starts(with: "watchOS") {
            return .iWatch
        }
        return .nativeMac
    }
}
