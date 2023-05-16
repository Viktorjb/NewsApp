//
//  AddArticleViewModel.swift
//  NewsApp
//
//  Created by Viktor on 2023-05-16.
//

import Foundation
import Firebase

class AddArticleViewModel: ObservableObject{
    
    let db = Firestore.firestore()
    @Published var titleContent : String = "Enter Title..."
    @Published var textContent : String = "Enter your article text here..."
    
    init(){}
    
    func requestArticle(){
        let newArticle = Article(heading:titleContent, content: textContent)
        //upload to firebase
        do{
            try db.collection("RequestedArticles").addDocument(from: newArticle)
        } catch{
            print("Error sending to Database")
        }
    }
    
    
}
