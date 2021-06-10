//
//  SearchBoxViewModel.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 08/06/2021.
//

import SwiftUI

class SearchBoxViewModel: NSObject, ObservableObject {
    
    @Published var dropDownMenuActivated: Bool = false
    @Published var userInputtedCity: String = ""
    
    func populateStack() {
        
    }
    
}

