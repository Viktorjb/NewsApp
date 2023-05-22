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
    @Published var categoryContent : Category = Category.unspecified
    
    //Message for the posting alert pop-up
    let alertMessage = "Thank you for your submission. Your article will soon be inspected by an admin. If approved, it will be published for other users to see."
    
    init(){}
    
    func requestArticle(){
        let newArticle = Article(heading:titleContent, content: textContent, category: categoryContent)
        //upload to firebase
        do{
            try db.collection("RequestedArticles").addDocument(from: newArticle)
        } catch{
            print("Error sending to Database")
        }
    }
    
    func uploadImage(_ image: UIImage) {
            // Handle the image upload logic
            // You can access the selected image here and perform the necessary operations
        }
    
    func AproveArticle(article: Article){
        do{
            try db.collection("PublishedArticles").addDocument(from: article)
            if let id = article.id{
                db.collection("RequestedArticles").document(id).delete()
            }
            
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
