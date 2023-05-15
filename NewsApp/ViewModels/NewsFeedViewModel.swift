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
    
    //En tom lista som håller artiklarna
    
}

func getArticleFeed() {
    let db = Firestore.firestore()
    
    
}
