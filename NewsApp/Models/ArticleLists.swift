//
//  ArticleLists.swift
//  NewsApp
//
//  Created by Viktor on 2023-05-15.
//

import Foundation
import Firebase

struct ArticleLists{
    //Articles that have been written and submitted but not yet approved
    var requestedArticles : [Article]
    //Approved articles that every user can see
    var publishedArticles : [Article]
    
    let db = Firestore.firestore()
    
    init() {
        self.requestedArticles = [Article]()
        self.publishedArticles = [Article]()
    }
    
    /*mutating func updateRequestedArticles(){
        //Clear requestedArticles and download data from firebase db.collection("RequestedArticles")
        db.collection("RequestedArticles").addSnapshotListener() {
            snapshot, err in
            
            guard let snapshot = snapshot else {return}
            
            if let err = err {
                print("Error getting document: \(err)")
            } else {
                self.requestedArticles.removeAll()
                for document in snapshot.documents{
                    do {
                        let article = try document.data(as : Article.self)
                        self.requestedArticles.append(article)
                    } catch {
                        print("Error reading from Database")
                    }
                }
            }
            
        }
    }*/
    
    func updatePublishedArticles(){
        //Clear publishedArticles and download data from firebase
    }
    
    
}
