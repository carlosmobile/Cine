//
//  AllMoviesView.swift
//  CineApp
//
//  Created by Carlos on 12/2/23.
//

import SwiftUI

struct MoviesView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = MoviesViewModel()
    @EnvironmentObject private var movieListViewModel: MovieListViewModel
    private let standardMargin: CGFloat = 16
    private let gridColumns = GridColumns()
    
    @State private var scrollOffset = CGFloat.zero
    @State private var scrollTotalHeight = CGFloat.zero
    @State private var scrollViewProxy: ScrollViewProxy?
    @State private var focusStatus: SearchColorStyle = .disabled
    @State private var isShowingSearch = true
    
    private let searchTextfieldHeight: CGFloat =  40.0
    private let searchTextfieldCornerRadius: CGFloat =  12.0
    
    // MARK: - View
    var body: some View {
        VStack() {
            if isShowingSearch {
                TextField("", text: $viewModel.textField).onTapGesture {
                    focusStatus = .active
                }.onChange(of: viewModel.textField) { newValue in
                    viewModel.filterMovies()
                }
                .padding(EdgeInsets(top: 2, leading: 20, bottom: 2, trailing: 6))
                .disableAutocorrection(true)
                .frame(height: searchTextfieldHeight)
                .placeholder(when: viewModel.textField.isEmpty) {
                    Text("searchPlaceHolder".localized)
                        .foregroundColor(TVThemeColor.TVGray.Color)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 8))
                }
                .autocapitalization(.none)
                .background(Color(.clear))
                .overlay(RoundedRectangle(cornerRadius: searchTextfieldCornerRadius, style: .continuous)
                    .stroke(StatusColorView(state: $focusStatus).render, lineWidth: 1))
                .padding([.trailing, .leading], 16)
            }
            
            TVCustomScrollView(scrollOffset: $scrollOffset,
                               scrollTotalHeight: $scrollTotalHeight) { proxy in
                LazyVGrid(columns: gridColumns.getFitDeviceNumberColumns(), spacing: 0) {
                    ForEach(viewModel.movies) { movie in
                        if let poster = movie.moviePictures[Constants.imagePoster] {
                            MultiImageItemView(urlImage: poster, fullItemCallback: {
                                movieListViewModel.showMovieDetailView(with: movie)
                            }).accessibilityIdentifier("imageButton")
                        }
                    }
                }.frame(width: UIScreen.screenWidth - standardMargin, alignment: .leading)
                .onAppear {
                    scrollViewProxy = proxy
                }
            }.onChange(of: scrollOffset) { offset in
                if offset > 1 {
                    withAnimation {
                        isShowingSearch = false
                    }
                } else {
                    withAnimation {
                        isShowingSearch = true
                    }
                }
            }
        }
        .padding(.top, 0)
        .onAppear {
            viewModel.originMovies = movieListViewModel.movies
            viewModel.filterMovies()
        }
    }
}

#if !TESTING
struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
#endif
