//
//  ContentView.swift
//  NewsApp
//
//  Created by Viktor on 2023-05-10.
//
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        VStack {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
                TabView{
                    
                    
                }
            }else{
                LoginView()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
