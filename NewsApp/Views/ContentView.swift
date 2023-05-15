//
//  ContentView.swift
//  NewsApp
//
//  Created by Viktor on 2023-05-10.
//
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @State var isprofile = false
    var body: some View {
        VStack {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
                Button(action: {
                    isprofile = true
                }, label: {
                    Text("profile")
                })
                .padding()
                .offset(x: 150)
                .navigationBarTitle("profile View")
                .fullScreenCover(isPresented: $isprofile) {
                    ProfileView()
                }
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
