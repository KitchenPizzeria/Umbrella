//
//  DropDownMenu.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 01/06/2021.
//

import SwiftUI
//
struct DropDownMenu: View {
    
    @EnvironmentObject var mapData: MapViewModel
    
    var body: some View {
        ScrollView{
            VStack(spacing:15) {
                ForEach(mapData.places){ place in
                    Text(place.place.name ?? "")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onTapGesture {
                            mapData.selectPlace(place: place)
                        }
                
                    Divider()
                }
            }

        }
        .frame(width: 200, height: 200)
        .background(Color.white)
    
    }
}

//
//struct DropDownMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        DropDownMenu()
//    }
//}
