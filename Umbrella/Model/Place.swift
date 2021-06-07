//
//  Place.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 31/05/2021.
//

import SwiftUI
import MapKit


struct Place: Identifiable {
    
    var id = UUID().uuidString
    var place: CLPlacemark
}
