//
//  MapView.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 27/05/2021.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @EnvironmentObject var mapData: MapViewModel
    
    func makeCoordinator() -> Coordinator {
        return MapView.Coordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let view = mapData.mapView
        view.showsUserLocation = true
        view.delegate = context.coordinator
        
        return view
    }

    func updateUIView(_ view: MKMapView, context: Context) {
//        if annotations.count != view.annotations.count {
//            view.removeAnnotations(view.annotations)
//            view.addAnnotations(annotations)
//        }
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            //Custom Pins ..
            
            // Excluding User Blue Pins
            
            if annotation.isKind(of: MKUserLocation.self){return nil}
            else{
                let pinAnnotation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin_View")
                pinAnnotation.tintColor = .blue
                pinAnnotation.animatesDrop = true
                pinAnnotation.canShowCallout = true
                
                return pinAnnotation
            }
        }
        
//        var parent: MapView
//
//        init(_ parent: MapView) {
//            self.parent = parent
//        }
//
//        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
//            parent.CenterCoord = mapView.centerCoordinate
//        }
        
    }
}

extension MKPointAnnotation {
    
    static var example: MKPointAnnotation {
        
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Home to the 2012 Summer Olympics."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        
        return annotation
    }
    
}
