//
//  TagAllMoviesViewModel.swift
//  CineApp
//
//  Created by Carlos on 12/2/23.
//

import SwiftUI

public class MoviesViewModel: ObservableObject {
    
    var columnsGrid: [GridItem] = []
    let iPhoneColumns = 3
    let iPadColumns = 5
    
    init() {
        setGridColumns()
    }
    
    private func setGridColumns() {
        var numberOfColumns = iPhoneColumns
        if TargetDevice.currentDevice() == .iPad {
            numberOfColumns = iPadColumns
        }
        
        for _ in 1...numberOfColumns {
            columnsGrid.append(GridItem(.flexible()))
        }
    }
}
