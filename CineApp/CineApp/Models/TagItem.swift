//
//  TagItem.swift
//  CineApp
//
//  Created by Carlos on 13/2/23.
//

struct TagItem: Equatable {
    var title: String
    var isSelected: Bool
    var filter: TagMoviesFilterBy
}

enum TagMoviesFilterBy: String, CaseIterable {
    case AllMovies
    case European
    case EEUU
    case American
    case Asian
    case Spain
    case Australian

    var title: String {
        switch self {
        case .AllMovies:
            return "tagAZ".localized
        case .European:
            return "tagEuropean".localized
        case .EEUU:
            return "tagUSA".localized
        case .American:
            return "tagAmerican".localized
        case .Asian:
            return "tagAsian".localized
        case .Spain:
            return "tagSpanish".localized
        case .Australian:
            return "tagAustralian".localized
        }
    }
    
    //TODO: hardcoded countries needs to arrive from api call
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
