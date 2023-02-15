//
//  MovieDetailViewModel.swift
//  CineApp
//
//  Created by Carlos on 14/2/23.
//

import SwiftUI

public class MovieDetailViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var movie: Movie = Movie()
    var directors: String = ""
    var screenWriter: String = ""
    var actors: String = ""
    var countries: String = ""
    
    // MARK: - Public methods
    func updateSelectedMovie(with movie: Movie) {
        resetFormatDetailData()
        formatDetailData(from: movie)
        self.movie = movie
    }
    
    // MARK: - Private methods
    private func formatDetailData(from movie: Movie) {
        for director in movie.directors {
            directors = directors + director + ", "
        }
        directors = String(directors.dropLast(2))
        
        for writer in movie.writers {
            screenWriter = screenWriter + writer + ", "
        }
        screenWriter = String(screenWriter.dropLast(2))
        
        for actor in movie.actors {
            actors = actors + actor + ", "
        }
        actors = String(actors.dropLast(2))
        
        for country in movie.country {
            countries = countries + country + ", "
        }
        countries = String(countries.dropLast(2))
    }
    
    private func resetFormatDetailData() {
        directors = ""
        screenWriter = ""
        actors = ""
        countries = ""
    }
}
