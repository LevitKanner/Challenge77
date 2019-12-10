//
//  MapView.swift
//  Challenge77
//
//  Created by Levit Kanner on 10/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable{
    
    
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> UIView {
        let mapView = MKMapView()
        return mapView
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<MapView>) {
        
    }
    
    
    
}
