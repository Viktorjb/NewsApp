//
//  NewsFeedView.swift
//  NewsApp
//
//  Created by David Salmberg on 2023-05-15.
//

import SwiftUI

struct NewsFeedView: View {
    @StateObject var viewModel = NewsFeedViewModel()

    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.articles, id: \.heading) { article in
                    HStack {
                        Text(article.heading)
                            .font(.title)
                            .bold()
                        
                        Spacer()
                        
                        Image("Image")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            viewModel.articleMockData()
        }
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}

