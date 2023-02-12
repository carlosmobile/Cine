//
//  ShowsByGenre.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

struct ShowsByGenre: Codable {
    let totalCount: Int
    let genre: String
    let movies: [Movie]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        totalCount = try container.decode(Int.self, forKey: .totalCount)
        genre = try container.decode(String.self, forKey: .genre)
        movies = try container.decodeIfPresent([Movie].self, forKey: .movies) ?? []
    }
    
    enum CodingKeys: String, CodingKey {
        case totalCount
        case genre
        case movies = "shows"
    }
}
