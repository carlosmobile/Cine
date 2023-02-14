//
//  GroupedMoviesViewModel.swift
//  CineApp
//
//  Created by Carlos on 12/2/23.
//

import SwiftUI

public class GroupedMoviesViewModel: ObservableObject {
    
    @Published var groupMovies: [String:[Movie]] = [:]
    var movies: [Movie] = []
    
    func groupMoviesBy(filter: TagMoviesFilterBy) {
        let moviesByCountry = Dictionary(grouping: movies) { (movie) -> String in
            guard let country = movie.country.first else { return "" }
            return country
        }
    
        groupMovies = filterByRegion(filter, moviesByCountry)
    }
    
    private func filterByRegion(_ filter: TagMoviesFilterBy,_ moviesByCountry: [String:[Movie]]) -> [String:[Movie]] {
        let countries = filter.getRegionFromMoviesType()
        var groupMoviesByRegion: [String:[Movie]] = [:]
        
        for country in countries {
            if let movies = moviesByCountry[country] {
                groupMoviesByRegion[country] = movies
            }
        }
        
        return groupMoviesByRegion
    }
}
