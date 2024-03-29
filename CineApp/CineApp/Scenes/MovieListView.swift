//
//  MovieListView.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

import SwiftUI

struct MovieListView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = MovieListViewModel()
    private let standardMargin: CGFloat = 16
    private let tagType = TagType()
    
    // MARK: - View
    var body: some View {
        GeometryReader { _ in
            ZStack() {
                VStack() {
                    Text(viewModel.title).padding([.top, .bottom], standardMargin)
                    TagView().environmentObject(viewModel)
                        .frame(width: UIScreen.screenWidth - standardMargin, alignment: .leading)
                        .padding(.bottom, 10)
                    tagType.getTagTypeView(tagType: viewModel.getSelectedTag(), viewModel: viewModel)
                }
                .padding(.top, 0)
                ZStack {
                    VStack {
                        HStack(alignment: .center, spacing: 0) {
                            MovieDetailView().environmentObject(viewModel)
                        }
                    }
                }
                .opacity(viewModel.isShowMovieDetailView ? 1.0 : 0.0)
                .scaleEffect(viewModel.isShowMovieDetailView ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 0.4), value: viewModel.isShowMovieDetailView)
            }.ignoresSafeArea(.keyboard, edges: .all)
        }
    }
}

#if !TESTING
struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
#endif
