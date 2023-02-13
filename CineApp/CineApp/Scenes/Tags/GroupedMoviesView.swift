//
//  GroupedMoviesView.swift
//  CineApp
//
//  Created by Carlos on 12/2/23.
//

import SwiftUI

struct GroupedMoviesView: View {
    
    @StateObject private var viewModel = GroupedMoviesViewModel()
    @EnvironmentObject var movieListViewModel: MovieListViewModel
    
    private let standardMargin: CGFloat = 16
    
    var body: some View {
        VStack() {
            ScrollView {
                ForEach(viewModel.groupMovies.keys.sorted(), id: \.self) { key in
                    HStack() {
                        
                    }
                    Text(key)
                    let movies = viewModel.groupMovies[key]
                    LazyVGrid(columns: viewModel.columnsGrid, spacing: 0) {
                        ForEach(movies!) { movie in
                            MultiImageItem(urlImage: movie.moviePictures["poster"] ?? "",
                                           fullItemCallback: {
                                //
                            },
                                           infoButtonCallback: {
                                //
                            })
                        }
                    }
                }
                .frame(width: UIScreen.screenWidth - standardMargin, alignment: .leading)
            }
        }
        .padding(.top, 0)
        .onChange(of: movieListViewModel.tags, perform: { _ in
            viewModel.groupMoviesBy(filter: movieListViewModel.getSelectedTag())
        })
        .onAppear {
            viewModel.movies = movieListViewModel.movies
            viewModel.groupMoviesBy(filter: movieListViewModel.getSelectedTag())
        }
    }
}

struct GroupedMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
