//
//  MapViewModel.swift
//  NewsApp
//
//  Created by Philip Miranda on 2023-05-19.
//

import Foundation
import CoreLocation

class MapViewModel : NSObject , CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var location : CLLocationCoordinate2D?
    
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    
    func startLocationUpdates() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        print("Plats uppdaterad \(locations)")
    }
    
    
    
    
    
}
