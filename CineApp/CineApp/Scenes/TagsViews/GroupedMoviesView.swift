//
//  GroupedMoviesView.swift
//  CineApp
//
//  Created by Carlos on 12/2/23.
//

import SwiftUI

struct GroupedMoviesView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = GroupedMoviesViewModel()
    @EnvironmentObject private var movieListViewModel: MovieListViewModel
    private let standardMargin: CGFloat = 16
    private let gridColumns = GridColumns()
    
    // MARK: - View
    var body: some View {
        VStack() {
            ScrollView {
                ForEach(viewModel.groupMovies.keys.sorted(), id: \.self) { key in
                    Text(key)
                    let movies = viewModel.groupMovies[key]
                    LazyVGrid(columns: gridColumns.getFitDeviceNumberColumns(), spacing: 0) {
                        ForEach(movies!) { movie in
                            if let poster = movie.moviePictures[Constants.imagePoster] {
                                MultiImageItemView(urlImage: poster, fullItemCallback: {
                                    movieListViewModel.showMovieDetailView(with: movie)
                                }).accessibilityIdentifier("imageButton")
                            }
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

#if !TESTING
struct GroupedMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
#endif
