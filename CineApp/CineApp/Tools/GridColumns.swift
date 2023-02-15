//
//  GridColumns.swift
//  CineApp
//
//  Created by Carlos on 13/2/23.
//

import SwiftUI

struct GridColumns {
    let iPhoneColumns = 3
    let iPadColumns = 5
    
    func getFitDeviceNumberColumns(_ mockDeviceToTests: String = "") -> [GridItem]  {
        var columnsGrid: [GridItem] = []
        var numberOfColumns = iPhoneColumns
        var targetDevice = TargetDevice.currentDevice()
        
        if !mockDeviceToTests.isEmpty {
            targetDevice = TargetDevice.currentDevice(mockDeviceToTests)
        }
        
        if targetDevice == .iPad {
            numberOfColumns = iPadColumns
        }
        
        for _ in 1...numberOfColumns {
            columnsGrid.append(GridItem(.flexible()))
        }
        
        return columnsGrid
    }
}
