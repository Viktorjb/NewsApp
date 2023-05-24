//
//  ForeignNewsViewModel.swift
//  NewsApp
//
//  Created by Linda Bergsängel on 2023-05-23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ForeignNewsViewModel: ObservableObject{
    
    let db = Firestore.firestore()
    @Published var foreignArticles = [Article]()
    
    func articleMockData() {
        let article1 = Article(heading: "ForeignArticle 1", content: "This is the content of foreign article 1.", category: "foreign")
        let article2 = Article(heading: "ForeignArticle 2", content: "This is the content of foreign article 2.", category: "foreign")
        let article3 = Article(heading: "ForeignArticle 3", content: "This is the content of foreign article 3.", category: "foreign")

        foreignArticles = [article1, article2, article3]
        }
    
    
    func listen2FS (){
        
        let itemsRef = db.collection("PublishedArticles").whereField("Category", in: ["Foreign"])
          
        itemsRef.addSnapshotListener() {
            snapshot, err in
            
            guard let snapshot = snapshot else {return}
            
            if let err = err {
                print("error\(err)")
            } else {
                
                self.foreignArticles.removeAll()
                
                for document in snapshot.documents{
                    
                    do{
                        
                        let article = try document.data(as : Article.self)
                        self.foreignArticles.append(article)
                     print("vi hämtar")
               
                    } catch {
                        print("Error")
                    }
                }
            }
        }
    }

}
