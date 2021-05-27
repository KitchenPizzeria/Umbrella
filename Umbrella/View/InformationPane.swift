//
//  InformationPane.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 27/05/2021.
//

import SwiftUI

struct InformationPane: View {
    
    @Binding var userCityInput: String
    @Binding var showWeatherInfoPanel: Bool
    @Binding var cityHasBeenSelected: Bool
    @Binding var hideMapView: Bool
    
    var body: some View {
        VStack (spacing: 0) {

            // MARK:- 7 day Weather Snapshot

            if cityHasBeenSelected {

                WeatherIconViewStack(showMenu: $showWeatherInfoPanel, userInput: $userCityInput,cityHasBeenSelected: $cityHasBeenSelected)


            } else {
                WeatherIconViewStack(showMenu: $showWeatherInfoPanel, userInput: $userCityInput,cityHasBeenSelected: $cityHasBeenSelected)

                    .overlay(

                        ZStack{

                            
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .foregroundColor(.offWhite.opacity(1))
                                .border(Color.gray.opacity(0.5),width: 5)
                                .cornerRadius(30)

                            Text("No city selected")
                                .font(.custom("noteworthy",size: 15))
                        }
                    )

            }

            //MARK:- Bottom Info Pane

            ZStack{

                NoneSelectedPanel()

                if showWeatherInfoPanel {

                    NoneSelectedPanel()
                        .offset(y:500)

                    WeatherInfoPanel()
                        .offset(y: showWeatherInfoPanel ? 0: 0)




                }
            }

        }

        .background(
            Color.clear
        )
        .offset(y:125)
    }
    
    
}


