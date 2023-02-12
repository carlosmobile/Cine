//
//  Movie.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

import Foundation

struct Movie: Identifiable, Codable {
    let id: String
    let title: String
    let directors: [String]
    let actors: [String]
    let writers: [String]
    let categories: [String]
    let year: Int
    let score: Double
    let synopsis: String
    let moviePictures: [String: String]
    let length: Int
    let country: [String]
    let ageCode: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        directors = try container.decode([String].self, forKey: .directors)
        actors = try container.decode([String].self, forKey: .actors)
        writers = try container.decode([String].self, forKey: .writers)
        categories = try container.decode([String].self, forKey: .categories)
        year = try container.decode(Int.self, forKey: .year)
        score = try container.decodeIfPresent(Double.self, forKey: .score) ?? -1
        synopsis = try container.decode(String.self, forKey: .synopsis)
        moviePictures = try container.decode([String: String].self, forKey: .moviePictures)
        length = try container.decode(Int.self, forKey: .length)
        country = try container.decode([String].self, forKey: .country)
        ageCode = try container.decode(String.self, forKey: .ageCode)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "eventId"
        case title
        case directors
        case actors
        case writers
        case categories = "tags"
        case year
        case score
        case synopsis = "synopsisEpisode"
        case moviePictures
        case length
        case country
        case ageCode
    }
}
