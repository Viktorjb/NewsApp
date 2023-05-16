//
//  ArticleLists.swift
//  NewsApp
//
//  Created by Viktor on 2023-05-15.
//

import Foundation
import Firebase

class ArticleLists{
    //Articles that have been written and submitted but not yet approved
    var requestedArticles : [Article]
    //Approved articles that every user can see
    var publishedArticles : [Article]
    //Database
    let db = Firestore.firestore()
    
    init() {
        self.requestedArticles = [Article]()
        self.publishedArticles = [Article]()
    }
    
    //Start a snapshotlistener for collection("RequestedArticles") and download data to requestedArticles
    func updateRequestedArticles(){
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
    }
    
    //Start a snapshotlistener for collection("PublishedArticles") and download data to publishedArticles
    func updatePublishedArticles(){
        db.collection("PublishedArticles").addSnapshotListener() {
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
    }
    
    
}
