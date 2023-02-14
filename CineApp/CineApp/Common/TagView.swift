//
//  TagView.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

import SwiftUI

struct TagView: View {
    // MARK: - Properties
    @EnvironmentObject var movieListViewModel: MovieListViewModel
    @State private var totalHeight = CGFloat.zero
    
    let tagItemHeight: CGFloat = 30
    let tagItemCornerRadius: CGFloat = 16
    
    // MARK: - View
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateAlignmentContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }
    
    // MARK: - Private methods
    private func generateAlignmentContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(0..<movieListViewModel.tags.count, id: \.self) { index in
                item(for: movieListViewModel.tags[index].title, isSelected: movieListViewModel.tags[index].isSelected)
                    .accessibilityIdentifier("tagButton")
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if movieListViewModel.tags[index].title == movieListViewModel.tags.last!.title {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { d in
                        let result = height
                        if movieListViewModel.tags[index].title == movieListViewModel.tags.last!.title {
                            height = 0 // last item
                        }
                        return result
                    }).onTapGesture {
                        deselectTag(in: index)
                        if !movieListViewModel.tags[index].isSelected {
                            movieListViewModel.tags[index].isSelected.toggle()
                        }
                    }
            }
        }.background(viewHeightReader($totalHeight))
    }
    
    private func deselectTag(in index: Int) {
        for i in 0..<movieListViewModel.tags.count {
            if i != index && movieListViewModel.tags[i].isSelected {
                movieListViewModel.tags[i].isSelected.toggle()
            }
        }
    }
    
    private func item(for text: String, isSelected: Bool) -> some View {
        Text(text)
            .foregroundColor(isSelected ? TVThemeColor.TVWhite.Color : TVThemeColor.TVBlack.Color)
            .padding()
            .lineLimit(1)
            .background(isSelected ? TVThemeColor.TVGrayStrong.Color : TVThemeColor.TVWhite.Color)
            .frame(height: tagItemHeight)
            .cornerRadius(tagItemCornerRadius)
            .overlay(Capsule().stroke(TVThemeColor.TVGrayStrong.Color, lineWidth: 1))
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}
