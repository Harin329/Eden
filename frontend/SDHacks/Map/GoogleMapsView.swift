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
    @Binding var gardens: [Garden]
    @Binding var selectedGarden: Garden?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(
            owner: self,
            gardens: $gardens,
            selectedGarden: $selectedGarden)
    }
    
    func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Self.Context) {
        mapView.clear()
        mapView.animate(toLocation: CLLocationCoordinate2D(latitude: selectedGarden?.latitude ?? coordinate.latitude, longitude: selectedGarden?.longitude ?? coordinate.longitude))
        if selectedGarden != nil {
            mapView.animate(toZoom: 17.0)
        }
        else {
            mapView.animate(toZoom: 12.0)
        }
        for garden in gardens {
            if selectedGarden?.latitude != garden.latitude && selectedGarden?.longitude != garden.longitude {
                let marker : GMSMarker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: garden.latitude, longitude: garden.longitude)
                marker.map = mapView
            }
            let rectanglePath = GMSMutablePath()
            rectanglePath.add(CLLocationCoordinate2D(latitude: garden.latitude + 0.001, longitude: garden.longitude - 0.001))
            rectanglePath.add(CLLocationCoordinate2D(latitude: garden.latitude - 0.001, longitude: garden.longitude - 0.001))
            rectanglePath.add(CLLocationCoordinate2D(latitude: garden.latitude - 0.001, longitude: garden.longitude + 0.001))
            rectanglePath.add(CLLocationCoordinate2D(latitude: garden.latitude + 0.001, longitude: garden.longitude + 0.001))
            rectanglePath.add(CLLocationCoordinate2D(latitude: garden.latitude + 0.001, longitude: garden.longitude - 0.001))
            let rectangle = GMSPolyline(path: rectanglePath)
            if selectedGarden?.latitude == garden.latitude && selectedGarden?.longitude == garden.longitude {
                rectangle.strokeColor = UIColor(.blue)
                rectangle.strokeWidth = 5.0
            }
            else {
                rectangle.strokeColor = UIColor(.black)
            }
            rectangle.map = mapView
        }
        
    }
    
    class Coordinator: NSObject, GMSMapViewDelegate, ObservableObject {
        
        let owner: MapView       // access to owner view members,
        @Binding var gardens: [Garden]
        @Binding var selectedGarden: Garden?
        
        init(
            owner: MapView,
            gardens: Binding<[Garden]>,
            selectedGarden: Binding<Garden?>
        ) {
            
            self.owner = owner
            _gardens = gardens
            _selectedGarden = selectedGarden
            
        }
        
        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            
            print("A marker has been touched")
            for garden in gardens {
                if garden.latitude == marker.position.latitude && garden.longitude == marker.position.longitude {
                    self.selectedGarden = garden
                }
            }
            
            return true
            
        }
        
    }
}
