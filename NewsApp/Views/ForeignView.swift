//
//  ForeignView.swift
//  NewsApp
//
//  Created by Linda Bergsängel on 2023-05-23.
//

import SwiftUI

struct ForeignView: View {
    @StateObject var viewModel = ForeignNewsViewModel()
    
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    ZStack {
                        Color.black
                            .frame(height: 110) // Adjust the height as needed
                        Text("Foreign news")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .bold()
                    }
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 110) // Adjust the height as needed
                    HStack{
                        ZStack {
                            Text("Latest news")
                                .font(.title2)
                                .bold()
                                .padding(.leading, 30)
                                .foregroundColor(Color.white)
                        }
                        
                        Rectangle()
                            .fill(Color.orange)
                            .frame(height: 2)
                            .padding(.top, 45) // Adjust the padding to align the thin line with the selected button
                        
                    }
                    
                    Spacer()
                    
                    VStack {
                        ScrollView {
                            VStack {
                                ForEach(viewModel.foreignArticles, id: \.heading) { article in
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

struct ForeignView_Previews: PreviewProvider {
    static var previews: some View {
        ForeignView()
    }
}
