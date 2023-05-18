//
//  NewsFeedView.swift
//  NewsApp
//
//  Created by David Salmberg on 2023-05-15.
//

import SwiftUI

struct NewsFeedView: View {
    @StateObject var viewModel = NewsFeedViewModel()
    @State private var isProfileActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    Color.black
                        .frame(height: 110) // Adjust the height as needed
                    Text("News")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .bold()
                }
                .edgesIgnoringSafeArea(.top)
                .frame(height: 110) // Adjust the height as needed
                
                ScrollView {
                    VStack {
                        ForEach(viewModel.articles, id: \.heading) { article in
                            HStack {
                                Text(article.heading)
                                    .font(.title)
                                    .bold()
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image("Image")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(10)
                            }
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                viewModel.articleMockData()
            }
            .navigationBarTitle("", displayMode: .inline) // Set an empty title to keep the navigation bar visible
            .navigationBarItems(trailing:
                NavigationLink(destination: ProfileView(), isActive: $isProfileActive) {
                    Image(systemName: "person.circle")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
            )
        }
    }
}


struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}


