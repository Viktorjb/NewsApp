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
            VStack(spacing: 20) {
                ForEach(viewModel.articles, id: \.heading) { article in
                    Text(article.heading)
                        .font(.title)
                        .bold()
                }
            }
            .padding()
        }
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
