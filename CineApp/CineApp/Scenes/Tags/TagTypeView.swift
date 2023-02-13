//
//  TagType.swift
//  CineApp
//
//  Created by Carlos on 12/2/23.
//

import SwiftUI

func getTagTypeView(tagType: TagMoviesFilterBy, viewModel: MovieListViewModel) -> AnyView {
    switch tagType {
    case .AllMovies:
        return AnyView(MoviesView().environmentObject(viewModel))
    case .European, .Asian, .Spain, .American, .EEUU, .Australian:
        return AnyView(GroupedMoviesView().environmentObject(viewModel))
    }
}
