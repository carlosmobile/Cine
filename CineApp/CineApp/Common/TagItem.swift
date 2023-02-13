//
//  TagItem.swift
//  CineApp
//
//  Created by Carlos on 13/2/23.
//

enum TagMoviesFilterBy: String {
    case AllMovies = "A-Z"
    case European = "Europeo"
    case EEUU = "Estados Unidos"
    case American = "Americano"
    case Asian = "Asiático"
    case Spain = "Español"
    case Australian = "Australiano"

    var title: String {
        return self.rawValue
    }
    
    func getRegionFromMoviesType() -> [String] {
        switch self {
        case .AllMovies:
            return [""]
        case .European:
            return ["Alemania", "Austria", "Bulgaria", "Bélgica",
                    "Dinamarca", "España", "Francia", "Irlanda",
                    "Italia", "Portugal", "Reino Unido",
                    "República Checa", "Rusia", "Suecia"]
        case .EEUU:
            return ["Estados Unidos"]
        case .American:
            return ["Argentina", "Brasil", "Canadá", "México"]
        case .Asian:
            return ["China", "Japón", "Tailandia"]
        case .Spain:
            return ["España"]
        case .Australian:
            return ["Australia"]
        }
    }
}

struct TagItem: Equatable {
    var title: String
    var isSelected: Bool
    var filter: TagMoviesFilterBy
}
