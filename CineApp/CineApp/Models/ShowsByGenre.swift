//
//  ShowsByGenre.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

struct ShowsByGenre {
    let totalCount: Int
    let genre: String
    let movies: [Movie]
}

extension ShowsByGenre: Codable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        totalCount = try container.decode(Int.self, forKey: .totalCount)
        genre = try container.decode(String.self, forKey: .genre)
        movies = try container.decode([Movie].self, forKey: .movies)
    }
    
    enum CodingKeys: String, CodingKey {
        case totalCount
        case genre
        case movies = "shows"
    }
}
