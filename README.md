# Cine app example

This demo app support iPhone and iPad layouts and implements the next screens:
<br>
- <b>Movie list with search and tags:</b>

The first screen consists of a list of movies. The header of the view has a list of tags to search grouped movies by country. The list shows movie images in a Grid. All Grid images are implemented with an automatic resize. The Grid was implemented as lazy memory and images caches don't use device memory.

You can search a movie too by title of the movie or director (or one of directors) of the movie. 

• [MovieListView](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/MovieListView.swift): Movie list principal view. It load tags and child tag view.<br>
• [MovieListViewModel](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/MovieListViewModel.swift): Movie list viewModel.<br>

Tags:<br>
• [TagType](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/Tags/TagType.swift): To get selected tag view.<br><br>
Tags Views:<br>
• [MoviesView](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/TagsViews/MoviesView.swift): To load a tag view A-Z with animated search textfield.<br>
• [MoviesViewModel](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/TagsViews/MoviesViewModel.swift): The view model to movies tag view.<br>
• [GroupedMoviesView](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/TagsViews/GroupedMoviesView.swift): To show each country tag. This view show movies grouped by tag region countries<br>
• [GroupedMoviesViewModel](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/TagsViews/GroupedMoviesViewModel.swift): The viewModel to grouped movies tag view.
<br>

Once you click on a movie poster of the list you will be redirected to another screen with more specific information about the movie.
<br>
- <b>Movie detail:</b>

The second screen will display more detailed information about a movie. Showing the title, year, lenght in minutes, country or countries are from, score, director or directors, writers, actors and synopsis. The synopsis has a vertical scroll.

• [MovieDetailView](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/MovieDetailView.swift): To show movie detail view. Its present like a modal view with shadows.<br>
• [MovieDetailViewModel](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/MovieDetailViewModel.swift): The viewModel to movie detail view.<br>
<br><br>
  
Example gifs with iPhone 14 Xcode simulator:

<img src="readme_images/iphone1.gif"  alt="Keys" width = 246px height = 500px >    <img src="readme_images/iphone2.gif"  alt="Movie" width = 246px height = 500px >    <img src="Readme_Images/iphone3.gif"  alt="Movie detail" width = 246px height = 500px >

<img src="readme_images/iphone4.gif"  alt="Keys" width = 246px height = 500px >    <img src="readme_images/iphone5.gif"  alt="Movie" width = 246px height = 500px >    <img src="readme_images/iphone6.gif"  alt="Movie detail" width = 251px height = 500px >

<img src="readme_images/iphone7.gif"  alt="Keys" width = 251 height = 500px >    <img src="readme_images/iphone8.gif"  alt="Movie" width = 251 height = 500px > 
<br><br>
Example gif with iPad Pro (11 inch) Xcode simulator:
 
 <img src="readme_images/ipad.gif"  alt="General" width = 443 height = 600px > 
 
<br><br> 

# Architecture

I use native <b>SwiftUI MVVM</b>, of course this is a flexible architecture and I can implement it in a basic or advanced way as needed.
This project supports UIKit and SwiftUI views. In case that we need to solve some issue with SwiftUI we can solve it using ViewModel fully compatible with both UIKit and SwiftUI views.<br><br>
MVVM is a "reactive" architecture. Its a perfect fit to use SwiftUI with Combine. The view reacts to changes on the view model, and the view model updates its state based on data from the model.

<p align="left">
  <img src="readme_images/basic-mvvm.png" width="700" height="382"/>
</p>

MVVM involves three layers:

- The <b>model layer</b> contains data access objects and validation logic. It knows how to read and write data, and it notifies the view model when data changes.<br><br>
- The <b>view model layer</b> contains the state of the view and has methods to handle user interaction. It calls methods on the model layer to read and write data, and it notifies the view when the model’s data changes.<br><br>
- The <b>view layer</b> styles and displays on-screen elements. It doesn’t contain business or validation logic. Instead, it binds its visual elements to properties on the view model. It also receives user inputs and interaction, and it calls methods on the view model in response.<br><br>
As a result, the view layer and model layer are completely decoupled. The view layer and model layer only communicate with the view model layer but we can binding model to view with Combine if we need to use reactive programming way.

This architecture has been used because it's considered an advance architecture that modulates the code and respect the clean code, SOLID principles and the best practices.

<br><br> 

# Tools

- [AttributedText](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Tools/AttributedText.swift): Helper to format html strings.<br>
- [GridColumns](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Tools/GridColumns.swift): Helper to show grid columns perfect fit size to iPad and iPhone screens.<br>
- [TargetDevice](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Tools/TargetDevice.swift): To get current target device to show GridColumns.<br>
- [TVCustomScrollView](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Tools/TVCustomScrollView.swift): Custom SwiftUI scroll to get scrollOffset, scrollTotalHeight and other info to improve scroll animations, in this case to improve search textfield show/hide.<br>
<br><br>

# Common

- [SearchColorStyle](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Common/SearchColorStyle.swift): Custom reusable SwiftUI color styles to change color states, in this case to search textfield.<br>
- [TagView](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Common/TagView.swift): Custom reusable SwiftUI view with alignment guides to show search tags.<br>
- [MultiImageItemView](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Common/MultiImageItemView.swift): Custom reusable SwiftUI View to show images in LazyGrid.<br>
- [CloseButtonView](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Common/CloseButtonView.swift): Custom reusable SwiftUI View to show close button, in this case to show movie detail close button.<br>
- [FormDetailView](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Common/FormDetailView.swift): Custom reusable SwiftUI View to show detail movie data in a better readability way.<br>
<br><br>

# Extension class

- [View](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Extension/View.swift): To add custom placeholder view to SwiftUI.<br>
- [UIScreen](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Extension/UIScreen.swift): Extension to get different screen sizes from UIScreen.<br>
- [Localized+String](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Extension/Localized%2BString.swift): To improve the LocalizedString sintax.<br>
<br><br>

# Models

Structs:

- [Movie](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Models/Movie.swift): To model Movie data.<br>
- [ShowsByGenre](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Models/ShowsByGenre.swift): To model Movie collections by genre.<br>
- [TagItem](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Models/TagItem.swift): To model tags to search.<br>
<br><br>

# Networking

- [DataManager](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Network/DataManager.swift): Manager to get and parse data from json to models.<br>
- [last7d.cine](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Network/last7d.cine.json): json origin movie data.<br>

<br><br>
# XCTests

This app test ViewModels, Models, Tools, Common, etc.. with [XCTests](https://github.com/carlosmobile/Cine/tree/main/CineApp/CineAppTests) and [UITests](https://github.com/carlosmobile/Cine/tree/main/CineApp/CineAppUITests).<br>
Test Coverage 100%

<p align="left">
  <img src="readme_images/coverage.png" width="620" height="639"/>
</p>

<br><br>
# Swift Guide Style

The app code follows the [Ray Wenderlich Swift Style Guide](https://github.com/raywenderlich/swift-style-guide). 
<br><br>
# Centralized data

The app uses in "support" logical folder a [ThemeManager.swift](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Support/ThemeManager.swift) class to support centralized colors. It also uses multilanguage with Localizable.strings to centralized all the text in the app.
<br><br>
# Swift Package Manager

- [Kingfisher](https://github.com/onevcat/Kingfisher): Used to implement an easy way to download images from server with animation spinner and fade.<br>
<br><br>
# GitFlow

This app is developed using [GifFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow), using only git commands and tool sourcetree.
<br><br>
# Design

The app try to implement nice design and UI/UX, respecting the iOS native elements as Apple guidelines and have a correct layout and implement the safe areas to correct view in last iPhone models.

<br><br>

# Getting Started

Running in Xcode 14.2 and iOS 16.3 Written in Swift 5
<br><br>

# Next..

Add network layer with real API service, add favourites, persistence of data, etc..
<br><br>

