//
//  TagView.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

import SwiftUI

enum Movies: String {
    case AllMovies = "A-Z"
    case European = "Cine europeo"
    case ByDates = "Por décadas"
    case Directors = "Directores"

    var description: String {
        return self.rawValue
    }
}

struct TagViewItem {
    var title: String
    var isSelected: Bool
}

struct TagView: View {
    
    @EnvironmentObject var movieListViewModel: MovieListViewModel
    @State private var totalHeight = CGFloat.zero
   
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(0..<movieListViewModel.tags.count, id: \.self) { index in
                item(for: movieListViewModel.tags[index].title, isSelected: movieListViewModel.tags[index].isSelected)
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
                    .alignmentGuide(.top, computeValue: {d in
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
            .foregroundColor(isSelected ? Color.white : Color.black)
            .padding()
            .lineLimit(1)
            .background(isSelected ? Color.black : Color.white)
            .frame(height: 30)
            .cornerRadius(16)
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
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
