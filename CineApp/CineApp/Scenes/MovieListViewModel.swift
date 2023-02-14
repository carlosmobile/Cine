//
//  MovieListViewModel.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

import SwiftUI

public class MovieListViewModel: ObservableObject {
    
    @Published var tags: [TagItem] = []
    @Published var isShowMovieDetailView: Bool = false
    
    var movies: [Movie] = []
    let title = "cineApp".localized
    var selectedMovie = Movie()
    
    init() {
        getDataModel()
        configureTags()
    }
    
    private func getDataModel() {
        let data = DataManager()
        movies = data.getAllMoviesFromShowsByGenre()
    }
    
    private func configureTags() {
        tags = [TagItem(title: TagMoviesFilterBy.AllMovies.title, isSelected: true, filter: .AllMovies),
                TagItem(title: TagMoviesFilterBy.Spain.title, isSelected: false, filter: .Spain),
                TagItem(title: TagMoviesFilterBy.European.title, isSelected: false, filter: .European),
                TagItem(title: TagMoviesFilterBy.American.title, isSelected: false, filter: .American),
                TagItem(title: TagMoviesFilterBy.EEUU.title, isSelected: false, filter: .EEUU),
                TagItem(title: TagMoviesFilterBy.Asian.title, isSelected: false, filter: .Asian),
                TagItem(title: TagMoviesFilterBy.Australian.title, isSelected: false, filter: .Australian)]
    }
    
    func getSelectedTag() -> TagMoviesFilterBy {
        var selectedTagTitle: TagMoviesFilterBy = .AllMovies
        for tagItem in tags {
            if tagItem.isSelected {
                selectedTagTitle = tagItem.filter
            }
        }
        return selectedTagTitle
    }
    
    func showMovieDetailView(with movie: Movie) {
        selectedMovie = movie
        isShowMovieDetailView = true
    }
}
