//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Viktor on 2023-05-10.
//

import SwiftUI
import FirebaseCore




@main
struct NewsAppApp: App {

    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
//            MapView()
        }
    }
}
