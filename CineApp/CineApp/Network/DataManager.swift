//
//  DataManager.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

import SwiftUI

struct Constants {
    static let baseURL = "https://media.tvup.cloud"
    static let imagePoster = "poster"
}

class DataManager: ObservableObject  {
    var showsByGenre = [ShowsByGenre]()
    var jsonFileName = "last7d.cine"
    var jsonFileExtension = "json"
    var error = ""
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: jsonFileName, withExtension: jsonFileExtension)
            else {
                error = "json file not found"
                return
            }
        
        guard let dataFromJSON = try? Data(contentsOf: url) else { return }
        guard let showsByGenre = try? JSONDecoder().decode([ShowsByGenre].self, from: dataFromJSON) else { return }
        self.showsByGenre = showsByGenre
    }
    
    func getAllMoviesFromShowsByGenre() -> [Movie] {
        var movies: [Movie] = []
        showsByGenre.forEach { showsByGenre in
            movies += showsByGenre.movies
        }
        
        let filterEmptyPoster = movies.filter({$0.moviePictures["poster"] != ""})
        let filterNilPoster = filterEmptyPoster.filter({$0.moviePictures["poster"] != nil})
        let filterEmptyCountry = filterNilPoster.filter({$0.country.first != ""})
        let filterNilCountry = filterEmptyCountry.filter({$0.country.first != nil})
                
        return filterNilCountry
    }
}
