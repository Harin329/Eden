//
//  Garden.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//

import SwiftUI
import GoogleMaps

struct Garden: Identifiable{
    let id = UUID()
    let name: String
    let address: String
    let latitude: Double
    let longitude: Double
    var coordinate: GMSMarker {
        GMSMarker(position: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
    }
}
