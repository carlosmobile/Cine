# Cine app example

This demo app supports iPhone and iPad layouts and implements the following screens:
<br>
- <b>Movie list with search and tags:</b>

The first screen displays a list of movies. The view's header includes a list of tags for searching movies grouped by country. The list presents movie images in a grid, with all grid images featuring automatic resizing. The grid is implemented to be memory-efficient, and image caching does not utilize device memory.

Users can also search for a movie by the movie's title or by the director (or one of the directors).

• [MovieListView](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/MovieListView.swift): The main movie list view. It loads tags and child tag views.<br>
• [MovieListViewModel](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/MovieListViewModel.swift): The view model for the movie list.<br>

Tags:<br>
• [TagType](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/Tags/TagType.swift): To get selected tag view.<br><br>
Tags Views:<br>
• [MoviesView](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/TagsViews/MoviesView.swift): Loads an A-Z tag view with an animated search text field.<br>
• [MoviesViewModel](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/TagsViews/MoviesViewModel.swift): The view model for the movies tag view.<br>
• [GroupedMoviesView](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/TagsViews/GroupedMoviesView.swift): Displays movies grouped by country tag. This view shows movies grouped by tag region countries.<br>
• [GroupedMoviesViewModel](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/TagsViews/GroupedMoviesViewModel.swift): The view model for the grouped movies tag view.
<br>

Clicking on a movie poster in the list redirects you to another screen with more specific information about the movie.
<br>
- <b>Movie detail:</b>

The second screen provides detailed information about a movie, including the title, year, length in minutes, countries of origin, score, directors, writers, actors, and synopsis. The synopsis is scrollable vertically.

• [MovieDetailView](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/MovieDetailView.swift): Displays the movie detail view. It is presented as a modal view with shadows.<br>
• [MovieDetailViewModel](https://github.com/carlosmobile/Cine/blob/main/CineApp/CineApp/Scenes/MovieDetailViewModel.swift): The view model for the movie detail view.<br>
<br><br>
  
Example gifs with iPhone 14 Xcode simulator:

<img src="readme_images/iphone_scroll.gif"  alt="cine" width = 250 height = 542px >    <img src="readme_images/iphone_tags.gif"  alt="cine" width = 250 height = 542px > 

<img src="readme_images/iphone_search.gif"  alt="cine" width = 250 height = 542px >    <img src="readme_images/iphone_detail.gif"  alt="cine" width = 250 height = 542px > 

<br><br>
Example gif with iPad Pro (11 inch) Xcode simulator:
 
 <img src="readme_images/ipad_scroll.gif"  alt="cine" width = 440 height = 630px >    <img src="readme_images/ipad_tags.gif"  alt="cine" width = 440 height = 630px > 
 
<br><br> 

# Architecture

I use native <b>SwiftUI MVVM</b>, which is a flexible architecture that can be implemented in a basic or advanced manner as needed. This project supports both UIKit and SwiftUI views. In case of issues with SwiftUI, we can address them using the ViewModel, which is fully compatible with both UIKit and SwiftUI views.<br><br>
MVVM is a "reactive" architecture, ideally suited for use with SwiftUI and Combine. The view reacts to changes in the view model, and the view model updates its state based on data from the model.

<p align="left">
  <img src="readme_images/basic-mvvm.png" width="700" height="382"/>
</p>

MVVM involves three layers:

- The <b>model layer</b> contains data access objects and validation logic. It is responsible for reading and writing data, and it notifies the view model when data changes.<br><br>
- The <b>view model layer</b> contains the state of the view and has methods to handle user interaction. It calls methods on the model layer for data access and updates the view when the model's data changes.<br><br>
- The <b>view layer</b> is responsible for styling and displaying on-screen elements without containing business or validation logic. It binds visual elements to the view model's properties, receives user inputs and interactions, and calls methods on the view model in response.<br><br>
As a result, the view and model layers are completely decoupled, communicating only through the view model layer. However, data binding between the model and view can be achieved with Combine for reactive programming.

This architecture is adopted for its advanced approach, facilitating modular code and adherence to clean code principles, SOLID principles, and best practices.
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
  <img src="readme_images/coverage.png" width="600" height="618"/>
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

The app aims to implement appealing design and UI/UX, adhering to iOS native elements as per Apple guidelines, ensuring a proper layout, and incorporating safe areas for optimal viewing on the latest iPhone models.
<br><br>

# Getting Started

Running in Xcode 14.2 and iOS 16.3 Written in Swift 5
<br><br>

# Next..

Add network layer with real API service, add favourites, data persistence, etc..
<br><br>
