//
//  AllMoviesView.swift
//  CineApp
//
//  Created by Carlos on 12/2/23.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject private var viewModel = MoviesViewModel()
    @EnvironmentObject var movieListViewModel: MovieListViewModel
    
    private let standardMargin: CGFloat = 16
    
    var body: some View {
        VStack() {
            ScrollView {
                LazyVGrid(columns: viewModel.columnsGrid, spacing: 0) {
                    ForEach(movieListViewModel.movies) { movie in
                        MultiImageItem(urlImage: movie.moviePictures["poster"] ?? "",
                                       fullItemCallback: {
                            //
                        },
                                       infoButtonCallback: {
                            //
                        })
                    }
                }
                .frame(width: UIScreen.screenWidth - standardMargin, alignment: .leading)
            }
        }
        .padding(.top, 0)
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
