//
//  MovieListViewModel.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

import SwiftUI

public class MovieListViewModel: ObservableObject {
    
    var movies: [Movie] = []
    
    let title = "Cine App"
    let iPhoneColumns = 3
    let iPadColumns = 5
    
    var columnsGrid: [GridItem] = []
    
    init() {
        getDataModel()
        setGridColumns()
    }
    
    private func getDataModel() {
        let data = DataManager()
        movies = data.getAllMoviesFromShowsByGenre()
    }
    
    private func setGridColumns() {
        var numberOfColumns = iPhoneColumns
        if TargetDevice.currentDevice == .iPad {
            numberOfColumns = iPadColumns
        }
        
        for _ in 1...numberOfColumns {
            columnsGrid.append(GridItem(.flexible()))
        }
    }
}
