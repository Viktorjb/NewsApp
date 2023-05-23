//
//  AmusementNewsViewModel.swift
//  NewsApp
//
//  Created by Linda Bergsängel on 2023-05-23.
//

import Foundation
import Firebase

class AmusementNewsViewModel: ObservableObject{
    
    let db = Firestore.firestore()
    @Published var amusementArticles = [Article]()
    
    func articleMockData() {
        let article1 = Article(heading: "Article 1", content: "This is the content of foreign article 1.", category: "Amusement")
        let article2 = Article(heading: "Article 2", content: "This is the content of foreign article 2.", category: "Amusement")
        let article3 = Article(heading: "Article 3", content: "This is the content of foreign article 3.", category: "Amusement")

        amusementArticles = [article1, article2, article3]
        }
    
    
    func getForeignArticleFeed() {
        let db = Firestore.firestore()
        
        
    }

}
