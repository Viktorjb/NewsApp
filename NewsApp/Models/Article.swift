//
//  Article.swift
//  NewsApp
//
//  Created by David Salmberg on 2023-05-15.
//

import Foundation

import UIKit

struct Article {
    var id = UUID()
    var heading: String
    var content: String
    var picture: UIImage?
    
    private var unformattedDate = Date()
    private let dateFormatter = DateFormatter()
    
    init(heading: String, content: String, picture: UIImage? = nil) {
        self.heading = heading
        self.content = content
        self.picture = picture
        dateFormatter.dateStyle = .medium
    }
    
    var date : String {
        return dateFormatter.string(from: unformattedDate)
    }
}
