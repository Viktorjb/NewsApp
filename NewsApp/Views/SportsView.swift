//
//  SportsNewsView.swift
//  NewsApp
//
//  Created by Linda Bergsängel on 2023-05-22.
//

import SwiftUI

struct SportsView: View {
    @StateObject var viewModel = SportsNewsViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    ZStack {
                        Color.black
                            .frame(height: 110) // Adjust the height as needed
                        Text("Sports news")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .bold()
                    }
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 110) // Adjust the height as needed
                    VStack {
                        ScrollView {
                            VStack {
                                ForEach(viewModel.sportsArticles, id: \.heading) { article in
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
                        .frame(maxHeight: .infinity) // Occupy the remaining available space
                        
                        Spacer() // Add a spacer to push the cop                                              p
                    }
                }
            }}
    }
}

struct SportView_Previews: PreviewProvider {
    static var previews: some View {
        SportsView()
    }
}
