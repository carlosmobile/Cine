//
//  MovieListView.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject private var viewModel = MovieListViewModel()
    
    private let standardMargin: CGFloat = 16
    
    var body: some View {
        VStack() {
            Text(viewModel.title).padding([.top, .bottom], standardMargin)
            ScrollView {
                LazyVGrid(columns: viewModel.columnsGrid, spacing: 0) {
                    ForEach(viewModel.movies) { movie in

                    }
                }
                .frame(width: UIScreen.screenWidth - standardMargin, alignment: .leading)
            }
            
        }
        .padding(.top, 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
