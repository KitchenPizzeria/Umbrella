//
//  InformationPane.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 27/05/2021.
//

import SwiftUI

struct InformationPane: View {
    
    @EnvironmentObject var snapshot: SnapshotViewModel
    @EnvironmentObject var mapData: MapViewModel
    
    @State private var offset = CGSize.zero
    
    var body: some View {
        VStack {
            
            SnapShotView()
            
            Spacer()
            
            WeatherInfoPanel()
        
            
        }
        
        .frame(width: UIScreen.main.bounds.width, height: 550)
        
        .onAppear {
            
            if mapData.citySelected {
                print("This will display the 7 icons")
            } else {
                print("This is will show the no city selected message")
            }
            
        }
        
        .gesture(
            DragGesture()
                .onChanged { value in
                    self.offset = value.translation
                }
                .onEnded { value in
                    self.offset = CGSize.zero
                }
        )
        
        .offset(y: self.offset.height)
        .padding(.vertical)
        .background(Color.offWhite.opacity(0.8))
        .cornerRadius(30)
    }
}
 
struct InformationPane_Previews: PreviewProvider {
    static var previews: some View {
        InformationPane()
            .environmentObject(SnapshotViewModel())
            .environmentObject(MapViewModel())
    }
}
