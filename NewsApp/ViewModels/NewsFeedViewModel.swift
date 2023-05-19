//
//  NewsFeedViewModel.swift
//  NewsApp
//
//  Created by David Salmberg on 2023-05-15.
//


import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewsFeedViewModel : ObservableObject {
    @Published var heading = ""
    @Published var content = ""
    @Published var image = UIImage?.self
    @Published var articles: [Article] = []  //En tom lista som håller artiklarna
    
    
    func articleMockData() {
            let article1 = Article(heading: "Article 1", content: "This is the content of article 1.")
            let article2 = Article(heading: "Article 2", content: "This is the content of article 2.")
            let article3 = Article(heading: "Article 3", content: "This is the content of article 3.")

            articles = [article1, article2, article3]
        }
   
    
    
}

func getArticleFeed() {
    let db = Firestore.firestore()
    
    
}
