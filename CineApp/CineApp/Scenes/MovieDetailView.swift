//
//  MovieDetailView.swift
//  CineApp
//
//  Created by Carlos on 14/2/23.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    
    @StateObject private var viewModel = MovieDetailViewModel()
    @EnvironmentObject var movieListViewModel: MovieListViewModel
    @State var close = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack () {
                Spacer()
                CloseButtonView(action: {
                    movieListViewModel.isShowMovieDetailView = false
                }, tintColor: TVThemeColor.TVGray.Color).accessibilityIdentifier("closeDetailButton")
            }.frame(alignment: .topTrailing)
            HStack() {
                VStack() {
                    KFImage.url(URL(string: Constants.baseURL + (viewModel.movie.moviePictures[Constants.imagePoster] ?? ""))!)
                        .placeholder {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                .scaleEffect(2)
                        }
                        .fade(duration: 0.25)
                        .resizable()
                        .setProcessor(ResizingImageProcessor(referenceSize: CGSize(width: UIScreen.screenWidth * UIScreen.screenScale, height: UIScreen.screenHeight * UIScreen.screenScale), mode: .aspectFit))
                        .memoryCacheExpiration(.expired)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 14))
                        .frame(width: UIScreen.screenWidth * 0.34, height: UIScreen.screenHeight * 0.185)
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                VStack(alignment: .leading) {
                    FormDetailView(title: "movieTitle".localized, value: viewModel.movie.title)
                    FormDetailView(title: "movieYear".localized, value: String(viewModel.movie.year))
                    FormDetailView(title: "movieLenght".localized, value: String(viewModel.movie.length) + "min")
                    FormDetailView(title: "movieCountry".localized, value: String(viewModel.countries))
                    FormDetailView(title: "movieScore".localized, value: String(viewModel.movie.score) + " / 5")
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            VStack(alignment: .leading) {
                FormDetailView(title: "movieDirector".localized, value: viewModel.directors, widthSize: 90)
                FormDetailView(title: "movieWriter".localized, value: viewModel.screenWriter, widthSize: 90)
                FormDetailView(title: "movieActors".localized, value: viewModel.actors, widthSize: 90)
            }.padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 16))
            ScrollView() {
                VStack() {
                    AttributedText(viewModel.movie.synopsis)
                }.padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 16))
            }
        }
        .padding(.all, 16)
            .frame(width: UIScreen.screenWidth * 1, height: UIScreen.screenHeight * 0.8, alignment: .topLeading)
            .background(TVThemeColor.TVWhite.Color)
            .opacity(0.99)
            .cornerRadius(24)
            .shadow(color: TVThemeColor.TVGray.Color.opacity(0.6), radius: 24, x: 0.0, y: 0.0)
        .onChange(of: movieListViewModel.selectedMovie, perform: { movie in
            viewModel.updateSelectedMovie(with: movie)
        })
    }
}


#if !TESTING
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
#endif
