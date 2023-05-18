//
//  AdminView.swift
//  NewsApp
//
//  Created by Youssef Azroun on 2023-05-15.
//

import SwiftUI
import FirebaseAuth

struct AdminView: View {
    @StateObject var viewModel = AddArticleViewModel()
    var body: some View {
        VStack{
            Text("Submitted articles")
                .bold()
                .font(.title)
            List{
                ForEach(viewModel.articles) { article in
                    VStack{
                        Text(article.heading)
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.red)
                        
                        Spacer()
                        
                        Text(article.content)
                        Spacer()
                        Button(action: {
                            // upload article to all users and delete it from the adminsView
                        }, label: {
                            Text("Aprove Article")
                                .frame(width: 130, height: 30)
                                .background(.green)
                                .cornerRadius(15)
                                .foregroundColor(.white)
                                .bold()
                        })
                    }
                }
                .onDelete() { IndexSet in
                    for index in IndexSet{
                        viewModel.delete(index: index)
                    }
                    
                }
            }
        }
        .onAppear {
            viewModel.listenToFireStore()
        }
        
    }
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}
