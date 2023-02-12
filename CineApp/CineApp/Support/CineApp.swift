//
//  CineApp.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

import SwiftUI

@main
struct CineApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            MovieListView()
        }
        
        WindowGroup {
            MovieListView()
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .active:
                print("The scene is in the foreground and interactive.")
            case .inactive:
                print("The scene is in the foreground but should pause its work.")
            case .background:
                print("The scene isn't currently visible in the UI.")
            @unknown default:
                break
            }
        }
    }
}
