//
//  MoviesViewModel.swift
//  CineApp
//
//  Created by Carlos on 15/2/23.
//

import SwiftUI

public class MoviesViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var movies: [Movie] = []
    @Published var textField = ""
    var originMovies: [Movie] = []
    
    // MARK: - Public methods
    func filterMovies() {
        filterByTitle()
    }
    
    // MARK: - Private methods
    private func filterByTitle() {
        if textField.isEmpty {
            movies = originMovies
        } else {
            movies = originMovies.filter {
                $0.title.lowercased().contains(textField.lowercased())
            }
            if movies.count == 0 {
                filterByDirectors()
            }
        }
    }
    
    private func filterByDirectors() {
        movies = originMovies.filter { movie in
            var finded = false
            for director in movie.directors {
                finded = director.lowercased().contains(textField.lowercased())
                if finded { break }
            }
            return finded
        }
    }
}
