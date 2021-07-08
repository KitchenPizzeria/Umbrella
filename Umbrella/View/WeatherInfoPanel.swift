//
//  Subview.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 26/05/2021.
//

import SwiftUI
import SwiftyJSON

let viewWidth = UIScreen.main.bounds.width
let viewHeight = UIScreen.main.bounds.height

struct WeatherInfoPanel: View {
    
    @EnvironmentObject var weatherInfo : WeatherPaneViewModel
    
    @State private var properties = WeatherPaneInfo.instance.allProperties()
    
    var body: some View {
        
        VStack{
  
            // Upper H-Stack
            HStack (alignment: .top){

                // 1st List
                VStack(spacing: -20) {

                    ForEach(0..<6) { x in
                        Text("\(properties[x])")
                            .font(.custom("noteworthy",size: 15))
                    }
                    .frame(width: 100, height: 50)
                }
                .frame(width: 100, height: 214)

                // 2nd List
                VStack(spacing: -20) {

                    ForEach(7..<12) { x in
                        Text("\(properties[x])")
                            .font(.custom("noteworthy",size: 15))
                    }
                    .frame(width: 100, height: 50)
                }
                .frame(width: 100, height: 214)

                // 3rd List
                VStack(spacing: -20) {

                    ForEach(12..<16) { x in
                        Text("\(properties[x])")
                            .font(.custom("noteworthy",size: 15))
                    }
                    .frame(width: 100, height: 50)
                }
                .frame(width: 100, height: 214)

            }
            .frame(width: 390, height: 214)


            // lower H-Stack
            HStack{

                // 1st List
                VStack(spacing: -20) {

                    ForEach(7..<12) { x in
                        Text("\(properties[x])")
                            .font(.custom("noteworthy",size: 15))
                    }
                    .frame(width: 100, height: 50)
                }
                .frame(width: 100, height: 214)


                // 2nd List
                VStack(spacing: -20) {

                    ForEach(13..<16) { x in
                        Text("\(properties[x])")
                            .font(.custom("noteworthy",size: 15))
                    }
                    .frame(width: 100, height: 50)
                }
                .frame(width: 100, height: 214)

            }
            .frame(width: 390, height: 214)

        }
        
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
            //.foregroundColor(.offWhite.opacity(0.8))
                .border(Color.gray,width: 5)
                .opacity(0.5)
                .cornerRadius(30)
                .frame(width: viewWidth - 10 ,height: viewHeight/2))
    
    }
}

struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoPanel()
    }
}

