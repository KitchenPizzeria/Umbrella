//
//  WeatherIconViewCell.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 22/05/2021.
//

import SwiftUI

struct WeatherIconViewCell: View {
    
    @State var day: String = "Mon"
    @State var image: String = "cloudy2"
    
    var body: some View {
  
        VStack(alignment: .center, spacing: 10) {
            
            Text(day.prefix(3))
                .foregroundColor(.black)
        
            
            Image(image)
                .resizable()
                .cornerRadius(15)
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
                .border(Color.white, width: 1)
                .cornerRadius(10)
          
            
            Button(action: {}, label: {
            
                Image(systemName: "rectangle.expand.vertical")
                    .padding(.bottom, 10)
                
            })
            
        }
        
        .frame(width: 50, height: 140, alignment: .bottom)
        .background(Color.white.opacity(0.3))
        .cornerRadius(20.0)
        .border(Color.black, width: 1)
            
        
            
    }
}

struct WeatherIconViewCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIconViewCell()
    }
}
