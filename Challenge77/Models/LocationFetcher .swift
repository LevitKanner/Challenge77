//
//  LocationFetcher .swift
//  Challenge77
//
//  Created by Levit Kanner on 10/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation
import CoreLocation

class LocationFetcher: NSObject , CLLocationManagerDelegate{
    let manager = CLLocationManager()
    var lastLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func start(){
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.lastLocation = locations.first?.coordinate
    }
    
}
