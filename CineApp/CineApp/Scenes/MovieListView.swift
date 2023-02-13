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
    private let tagType = TagType()
    
    var body: some View {
        VStack() {
            Text(viewModel.title).padding([.top, .bottom], standardMargin)
            TagView().environmentObject(viewModel)
                .frame(width: UIScreen.screenWidth - 16, alignment: .leading)
                .padding(.bottom, 10)
            tagType.getTagTypeView(tagType: viewModel.getSelectedTag(), viewModel: viewModel)
        }
        .padding(.top, 0)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
