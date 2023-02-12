//
//  MovieListViewModel.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

import SwiftUI

public class MovieListViewModel: ObservableObject {
    
    @Published var tags: [TagViewItem] = []
    
    var movies: [Movie] = []
    var columnsGrid: [GridItem] = []
    let title = "Cine App"
    let iPhoneColumns = 3
    let iPadColumns = 5
    
    init() {
        getDataModel()
        setGridColumns()
        configureTags()
    }
    
    private func getDataModel() {
        let data = DataManager()
        movies = data.getAllMoviesFromShowsByGenre()
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
    
    private func configureTags() {
        tags = [TagViewItem(title: Movies.AllMovies.description, isSelected: true),
                TagViewItem(title: Movies.European.description, isSelected: false),
                TagViewItem(title: Movies.ByDates.description, isSelected: false),
                TagViewItem(title: Movies.Directors.description, isSelected: false)]
    }
}
