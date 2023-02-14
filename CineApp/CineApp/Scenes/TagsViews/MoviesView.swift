//
//  AllMoviesView.swift
//  CineApp
//
//  Created by Carlos on 12/2/23.
//

import SwiftUI

struct MoviesView: View {
    
    // MARK: - Properties
    @EnvironmentObject var movieListViewModel: MovieListViewModel
    private let standardMargin: CGFloat = 16
    private let gridColumns = GridColumns()
    
    // MARK: - View
    var body: some View {
        VStack() {
            ScrollView {
                LazyVGrid(columns: gridColumns.getFitDeviceNumberColumns(), spacing: 0) {
                    ForEach(movieListViewModel.movies) { movie in
                        MultiImageItemView(urlImage: movie.moviePictures[Constants.imagePoster] ?? "", fullItemCallback: {
                            movieListViewModel.showMovieDetailView(with: movie)
                        }).accessibilityIdentifier("imageButton")
                    }
                }
                .frame(width: UIScreen.screenWidth - standardMargin, alignment: .leading)
            }
        }
        .padding(.top, 0)
    }
}

#if !TESTING
struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
#endif
