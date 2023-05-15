//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by David Salmberg on 2023-05-15.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ArticleViewModel : ObservableObject {
    
    
    @Published var heading = ""
    @Published var content = ""

    
}


func getArticle() {
    //hämta artikel via ID:et
}
