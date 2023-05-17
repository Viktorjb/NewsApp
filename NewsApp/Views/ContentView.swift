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
    @State var isProfile = false
    
    init() {
        // Customize the appearance of the navigation bar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .darkGray
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                    Button(action: {
                        isProfile = true
                    }, label: {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.black)
                    })
                    .padding()
                    .offset(x: 150)
                    .navigationBarTitle("News")
                    .font(.title)
                    .fullScreenCover(isPresented: $isProfile) {
                        ProfileView()
                    }
                    .edgesIgnoringSafeArea(.top)
                    
                    NewsFeedView()
                        .edgesIgnoringSafeArea(.top)
                } else {
                    LoginView()
                }
            }
            .padding()
        }
        .navigationViewStyle(StackNavigationViewStyle()) 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

