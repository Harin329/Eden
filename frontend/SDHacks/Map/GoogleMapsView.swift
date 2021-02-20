//
//  GoogleMaps.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//

import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
    let coordinate = CLLocationCoordinate2D(latitude: 32.7157 , longitude: -117.1611 )
    let cities = [
        [
            "name": "Garden 1",
            "lat": 32.6157,
            "long": -117.0611
        ],
        [
            "name": "Garden 2",
            "lat": 32.8157,
            "long": -117.2611
        ]
    ]

    func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Self.Context) {

        for city in cities {
            let marker : GMSMarker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: city["lat"] as! CLLocationDegrees, longitude: city["long"] as! CLLocationDegrees)
            marker.title = city["name"] as? String
            marker.snippet = "Welcome to \(city["name"] as! String)"
            marker.map = mapView
            let rectanglePath = GMSMutablePath()
            rectanglePath.add(CLLocationCoordinate2D(latitude: city["lat"] as! CLLocationDegrees + 0.05, longitude: city["long"] as! CLLocationDegrees - 0.05))
            rectanglePath.add(CLLocationCoordinate2D(latitude: city["lat"] as! CLLocationDegrees - 0.05, longitude: city["long"] as! CLLocationDegrees - 0.05))
            rectanglePath.add(CLLocationCoordinate2D(latitude: city["lat"] as! CLLocationDegrees - 0.05, longitude: city["long"] as! CLLocationDegrees + 0.05))
            rectanglePath.add(CLLocationCoordinate2D(latitude: city["lat"] as! CLLocationDegrees + 0.05, longitude: city["long"] as! CLLocationDegrees + 0.05))
            rectanglePath.add(CLLocationCoordinate2D(latitude: city["lat"] as! CLLocationDegrees + 0.05, longitude: city["long"] as! CLLocationDegrees - 0.05))
            let rectangle = GMSPolyline(path: rectanglePath)
            rectangle.map = mapView
        }
    }
}
