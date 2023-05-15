//
//  ArticleLists.swift
//  NewsApp
//
//  Created by Viktor on 2023-05-15.
//

import Foundation

struct ArticleLists /*: Codable*/{
    let requestedArticles : [Article]
    let publishedArticles : [Article]
    
    func updateRequestedArticles(){
        //Clear requestedArticles and download data from firebase
    }
    
    func updatePublishedArticles(){
        //Clear publishedArticles and download data from firebase
    }
}
