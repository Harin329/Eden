//
//  GoogleMaps.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//

import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
    let MapStyle = """
[
    {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#6195a0"
            }
        ]
    },
    {
        "featureType": "administrative.province",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": "0"
            },
            {
                "saturation": "0"
            },
            {
                "color": "#f5f5f2"
            },
            {
                "gamma": "1"
            }
        ]
    },
    {
        "featureType": "landscape.man_made",
        "elementType": "all",
        "stylers": [
            {
                "lightness": "-3"
            },
            {
                "gamma": "1.00"
            }
        ]
    },
    {
        "featureType": "landscape.natural.terrain",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#bae5ce"
            },
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "saturation": -100
            },
            {
                "lightness": 45
            },
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#fac9a9"
            },
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "labels.text",
        "stylers": [
            {
                "color": "#4e4e4e"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#787878"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "transit.station.airport",
        "elementType": "labels.icon",
        "stylers": [
            {
                "hue": "#0a00ff"
            },
            {
                "saturation": "-77"
            },
            {
                "gamma": "0.57"
            },
            {
                "lightness": "0"
            }
        ]
    },
    {
        "featureType": "transit.station.rail",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#43321e"
            }
        ]
    },
    {
        "featureType": "transit.station.rail",
        "elementType": "labels.icon",
        "stylers": [
            {
                "hue": "#ff6c00"
            },
            {
                "lightness": "4"
            },
            {
                "gamma": "0.75"
            },
            {
                "saturation": "-68"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#eaf6f8"
            },
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#c7eced"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "lightness": "-49"
            },
            {
                "saturation": "-53"
            },
            {
                "gamma": "0.79"
            }
        ]
    }
]
"""
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
        do {
            mapView.mapStyle = try GMSMapStyle(jsonString: MapStyle)
        }
        catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Self.Context) {
        mapView.clear()
        mapView.animate(toLocation: CLLocationCoordinate2D(latitude: selectedGarden?.latitude ?? coordinate.latitude, longitude: selectedGarden?.longitude ?? coordinate.longitude))
        if selectedGarden != nil {
            mapView.animate(toZoom: selectedGarden!.zoom)
        }
        else {
            mapView.animate(toZoom: 12.0)
        }
        for garden in gardens {
            if selectedGarden?.latitude != garden.latitude && selectedGarden?.longitude != garden.longitude {
                let marker : GMSMarker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: garden.latitude, longitude: garden.longitude)
                marker.icon = UIImage(named: "pin")
                marker.map = mapView
            }
            let rectanglePath = GMSMutablePath()
            if garden.name == "Golden Hill Community Garden" {
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.740821, longitude: -117.133811))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.732453, longitude: -117.133478))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.737040, longitude: -117.125574))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.736135, longitude: -117.125511))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.731239, longitude: -117.133692))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.727545, longitude: -117.133873))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.727051, longitude: -117.135280))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.725324, longitude: -117.135245))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.725008, longitude: -117.133920))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.719509, longitude: -117.133998))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.719352, longitude: -117.144209))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.721799, longitude: -117.141386))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.722644, longitude: -117.142661))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.719445, longitude: -117.147362))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.722461, longitude: -117.153590))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.723225, longitude: -117.159039))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.740975, longitude: -117.159372))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.741077, longitude: -117.158222))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.742299, longitude: -117.158343))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.742284, longitude: -117.156479))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.744389, longitude: -117.156148))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.744328, longitude: -117.155357))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.743462, longitude: -117.155034))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.744339, longitude: -117.151391))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.742857, longitude: -117.151355))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.741204, longitude: -117.155417))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.740821, longitude: -117.133811))
            }
            else if garden.name == "Smarts Farm Garden"{
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.754014, longitude: -117.135066))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.750413, longitude: -117.135028))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.750423, longitude: -117.133932))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.754003, longitude: -117.133945))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.754014, longitude: -117.135066))

            }
            else if garden.name == "The Villiage Community Garden"{
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.760419, longitude: -117.195010))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.759463, longitude: -117.190524))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.759223, longitude: -117.184868))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.757921, longitude: -117.185042))
                
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.758776, longitude: -117.189720))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.758546, longitude: -117.189962))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.758225, longitude: -117.189702))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.757699, longitude: -117.190245))
                
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.756898, longitude: -117.189265))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.756501, longitude: -117.189536))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.756127, longitude: -117.189123))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.755865, longitude: -117.189515))
                
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.757533, longitude: -117.191871))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.755510, longitude: -117.194126))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.758509, longitude: -117.195726))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.759114, longitude: -117.196532))
                
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.760419, longitude: -117.195010))

            }
            else {
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.709357, longitude: -117.157432))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.709331, longitude: -117.156430))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.708423, longitude: -117.156363))
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.708395, longitude: -117.157465))
                
                rectanglePath.add(CLLocationCoordinate2D(latitude: 32.709357, longitude: -117.157432))
            }
            let rectangle = GMSPolygon(path: rectanglePath)
            if selectedGarden?.latitude == garden.latitude && selectedGarden?.longitude == garden.longitude {
                rectangle.strokeColor = UIColor(Color(hex: "15BE45"))
                rectangle.strokeWidth = 5.0
                rectangle.fillColor = UIColor(Color(hex: "81E49D").opacity(0.4))
            }
            else {
                rectangle.strokeColor = UIColor(Color(hex: "15BE45"))
                rectangle.fillColor = UIColor(.clear)
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
