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
    @Published var articles = [Article]()
    @Published var titleContent : String = "Enter Title..."
    @Published var textContent : String = "Enter your article text here..."
    
    
    func requestArticle(){
        let newArticle = Article(heading:titleContent, content: textContent)
        //upload to firebase
        do{
            try db.collection("RequestedArticles").addDocument(from: newArticle)
        } catch{
            print("Error sending to Database")
        }
    }
    
    
    func listenToFireStore(){
            
        db.collection("RequestedArticles").addSnapshotListener() {
                snapshot, error in
                
                guard let snapshot = snapshot else {return}
                if let error = error {
                    print("Error listning to FireStore \(error)")
                }else{
                    self.articles.removeAll()
                    for document in snapshot.documents{
                        do{
                            let article = try document.data(as: Article.self)
                            self.articles.append(article)
                        }catch{
                            print("Error reading from FireStore")
                        }
                    }
                    
                }
            }
        }
    
    func delete (index: Int) {
            
            let article = articles[index]
            if let id = article.id{
                db.collection("RequestedArticles").document(id).delete()
            }
        }
    
    
}
