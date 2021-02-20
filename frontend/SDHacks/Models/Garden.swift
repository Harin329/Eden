//
//  Garden.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//

import SwiftUI
import MapKit

struct Garden: Identifiable {
    let id = UUID()
    let name: String
    let rating: Int
    let description: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
