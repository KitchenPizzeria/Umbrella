//
//  SIdeMenuViewModel.swift
//  Site-Seeing
//
//  Created by Joseph Meyrick on 06/05/2021.
//

import Foundation

enum SideMenuViewModel : Int, CaseIterable {
    case profile // general user information
    case itinerary // list of places to visit
    case map // this will show a map view of all the locations chosen in itinerary/on map
    case bookmarks // User can bookmark locations to be viewed at a later date
    
    var title: String {
        switch self {
            case .profile: return "profile"
            case .itinerary: return "itinerary"
            case .map : return "map"
            case .bookmarks: return "bookmarks"
        }
        
    }
    
    var logo: String {
        switch self {
            case .profile: return "person"
            case .itinerary: return "list.number"
            case .map : return "map"
            case .bookmarks: return "book"
        }
        
    }
    
}
