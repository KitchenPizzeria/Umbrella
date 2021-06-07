//
//  WeatherModel.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 20/05/2021.
//

import SwiftUI

struct DropDownButton: PrimitiveButtonStyle {

    var color: Color = Color.gray

    func makeBody(configuration: PrimitiveButtonStyle.Configuration) -> some View {
        MyButton(configuration: configuration, color: color)
    }
   
    struct MyButton: View {
        @State private var pressed = false
        @State var sender: Int = 0

        let configuration: PrimitiveButtonStyle.Configuration
        let color: Color

        var body: some View {

            return configuration.label
                .foregroundColor(.white)
                .padding(15)
                .background(RoundedRectangle(cornerRadius: 5).fill(color))
                .compositingGroup()
                .shadow(color: .black, radius: 3)
                .opacity(self.pressed ? 0.5 : 1.0)
                .scaleEffect(self.pressed ? 0.8 : 1.0)
                .onLongPressGesture(minimumDuration: 2.5, maximumDistance: .infinity, pressing: { pressing in
                withAnimation(.easeInOut(duration: 1.0)) {
                    self.pressed = pressing
                }
                if pressing {
                    print("My long pressed starts")
                    print("     I can initiate any action on start")
                } else {
                    print("My long pressed ends")
                    print("     I can initiate any action on end")
                }
            }, perform: { })
        }
    }
}

class WeatherIcon: Identifiable {
    
    @Published var dayString: String = ""
    @Published var imageString: String = ""
    var button = DropDownButton()
    
    var id = UUID()
    
    func getWeatherIcon(condition: Double) -> String {
        
        switch (condition) {
        
            case 0...300 :
                return "tstorm1"
            
            case 301...500 :
                return "light_rain"
            
            case 501...600 :
                return "shower3"
            
            case 601...700 :
                return "snow4"
            
            case 701...771 :
                return "fog"
            
            case 772...799 :
                return "tstorm3"
            
            case 800 :
                return "sunny"
            
            case 801...804 :
                return "cloudy2"
            
            case 900...903, 905...1000  :
                return "tstorm3"
            
            case 903 :
                return "snow5"
            
            case 904 :
                return "sunny"
            
            default :
                return "dunno"
        }
    }
}
