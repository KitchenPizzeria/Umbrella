//
//  HomeView.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 24/05/2021.
//

import SwiftUI



struct HomeView: View {
    
    @State private var userCityInput = ""
    @State private var showWeatherInfoPanel = false
    @State private var cityHasBeenSelected = false
    @State private var hideMapView = true


    let controller = HomeViewController()
    
    let viewWidth = UIScreen.main.bounds.width
    let viewHeight = UIScreen.main.bounds.height

    var body: some View {
    
    
        ZStack {
            
            MapView()
                
            SearchBoxView(userInput: "",cityHasBeenSelected: $cityHasBeenSelected,hideMapView: $hideMapView)
            
                .padding(.bottom, 680)
            
            
            
            InformationPane(userCityInput:.constant(""), showWeatherInfoPanel: .constant(true), cityHasBeenSelected: .constant(true), hideMapView: .constant(true))
                .offset(y: hideMapView ? 0:650)
            
            

        }
    }
}
    


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
