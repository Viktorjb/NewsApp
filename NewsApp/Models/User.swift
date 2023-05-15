//
//  User.swift
//  NewsApp
//
//  Created by Linda Bergsängel on 2023-05-13.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
