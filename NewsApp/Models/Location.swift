//
//  Location.swift
//  NewsApp
//
//  Created by Philip Miranda on 2023-05-19.
//

import Foundation
import CoreLocation



struct Location : Identifiable {
    var id = UUID()
    
    var newsName : String
    var latitude : Double
    var longitude : Double
    
    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude : longitude)
    }
    
    
}
