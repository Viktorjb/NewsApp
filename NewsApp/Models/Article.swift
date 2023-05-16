//
//  Article.swift
//  NewsApp
//
//  Created by David Salmberg on 2023-05-15.
//

import Foundation
import FirebaseFirestoreSwift
import UIKit

struct Article : Codable{
    @DocumentID var id : String?
    //var id = UUID()
    var heading: String
    var content: String
    //var picture: UIImage? // Temporarily commented out to conform to "codable"
    
    
    //private var unformattedDate = Date() // Temporarily commented out to conform to "codable"
    //private let dateFormatter = DateFormatter() // Temporarily commented out to conform to "codable"
    
    init(heading: String, content: String, picture: UIImage? = nil) {
        self.heading = heading
        self.content = content
        //self.picture = picture // Temporarily commented out to conform to "codable"
        let dateFormatter = DateFormatter() // Temporarily moved here to conform to "codable"
        dateFormatter.dateStyle = .medium
    }
    
    var date : String {
        var unformattedDate = Date() // Temporarily moved here to conform to "codable"
        let dateFormatter = DateFormatter() // Temporarily moved here to conform to "codable"
        return dateFormatter.string(from: unformattedDate)
    }
}
