//
//  Movie.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

import Foundation

struct Movie {
    let id: String
    let title: String
    let directors: [String]
    let actors: [String]
    let writers: [String]
    let year: Int
    let score: Double
    let synopsis: String
    let moviePictures: [String: String]
    let length: Int
    let country: [String]
    
    init() {
        self.id = ""
        self.title = ""
        self.directors = [""]
        self.actors = [""]
        self.writers = [""]
        self.year = 0
        self.score = 0
        self.synopsis = ""
        self.moviePictures = ["":""]
        self.length = 0
        self.country = [""]
    }
}

extension Movie: Identifiable, Codable, Equatable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        directors = try container.decode([String].self, forKey: .directors)
        actors = try container.decode([String].self, forKey: .actors)
        writers = try container.decode([String].self, forKey: .writers)
        year = try container.decode(Int.self, forKey: .year)
        score = try container.decode(Double.self, forKey: .score)
        synopsis = try container.decode(String.self, forKey: .synopsis)
        moviePictures = try container.decode([String: String].self, forKey: .moviePictures)
        length = try container.decode(Int.self, forKey: .length)
        country = try container.decode([String].self, forKey: .country)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "eventId"
        case title
        case directors
        case actors
        case writers
        case year
        case score
        case synopsis = "synopsisEpisode"
        case moviePictures
        case length
        case country
    }
}
