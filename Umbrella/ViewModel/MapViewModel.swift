//
//  MapViewModel.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 30/05/2021.
//

import SwiftUI
import MapKit
import CoreLocation
import SwiftyJSON
import Alamofire

class MapViewModel : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    //@Binding var userInputtedCity: String
    var snapshotController: SnapshotViewModel!
    
    @Published var mapView = MKMapView()
    
    // Region of Map
    @Published var region : MKCoordinateRegion!
    
    //Alert ..
    @Published var permissionDenied = false
    
    // Map Type
    @Published var mapType : MKMapType = .standard
    
    //SearchText
    @Published var userCityInput = ""
    
    // Searched Places
    @Published var places: [Place] = []
    
    // has the user inputted a city
    @Published var citySelected : Bool = false
    
    // Slide information view into and out of view
    @Published var hideMapView = true
    
    // Coordinates of chosen city
    @Published var Coordinates = CLLocationCoordinate2D()
    
    
    

    // Search Places for the city which user has inputted
    func searchQuery(){
        
        places.removeAll()
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = userCityInput
        
        // Fetch ..
        MKLocalSearch(request: request).start { (response, _) in
            
            guard let result = response else {return}
            
            self.places = result.mapItems.compactMap({ item -> Place? in
                return Place(place: item.placemark)
            })
            
        }
        
    }

        
    
    // Updating Map Type ...
    func updateMapType() {
        
        if mapType == .standard {
            mapType = .hybrid
            mapView.mapType = mapType
        } else {
            mapType = .standard
            mapView.mapType = mapType
        }
    }
    
    // Focussing Location .
    func focusLocation() {
        //Check that region currently exists
        guard let _ = region else {return}
        mapView.setRegion(region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    // get coordinates from user inputted location
    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> ()) {
        CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1) }
    }
    
    func getCoordsOfUserInputtedCity(){
        
        self.getCoordinateFrom(address: self.userCityInput) { coordinate, error in
       
            guard coordinate != nil else {print("error retrieving coordinates"); return}
            
            self.Coordinates.latitude = coordinate?.latitude ?? 0
            self.Coordinates.longitude = coordinate?.longitude ?? 0
            
            self.snapshotController.getWeatherData(lat: self.Coordinates.latitude,
                                                   lon: self.Coordinates.longitude,
                                                   city: self.userCityInput)

            withAnimation(.spring()) {
                self.citySelected.toggle()
            }
          }

        
    }
    
    //Pick search result
    func selectPlace(place: Place){
        //Showing pin on map
        userCityInput = ""
        guard let coordinate = place.place.location?.coordinate else {return}
        
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.coordinate = coordinate
        pointAnnotation.title = place.place.name ?? "No Name"
        
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(pointAnnotation)
        
        // Moving Map to that location
        
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        // Checking Permissions ...
        
        switch manager.authorizationStatus {
        
        case .denied:
            // Alert to tell user theyve denied the app to get their location
            permissionDenied.toggle()
            
        case .notDetermined:
            //Requesting that user gives location
            manager.requestWhenInUseAuthorization()
        
        case .authorizedWhenInUse:
            manager.requestLocation()
        default:
            ()
        }
    }
        
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //Error
        //print(error.localizedDescription)
        print(error)
    }
        
    
    // Getting user Region
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        
        self.region = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: 10000,longitudinalMeters: 10000)
        
        // Updating
        self.mapView.setRegion(self.region, animated: true )
        
        self.mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
        
    }

    





