//
//  SearchBoxView.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 23/05/2021.
//

import SwiftUI



struct SearchBoxView: View {
    
 
    let CURRENT_WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather"
    let SIXTEENDAY_WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather"
    let FOUR_DAY_HOURLY_URL = "https://pro.openweathermap.org/data/2.5/forecast/hourly"
    let APP_ID = "3c904a90e1b32e94a22ffdb510958557"
    
    let controller = HomeViewController()
    
    @State var userInput: String = ""
    
    var body: some View {
        
        VStack {
        
            Text("Search for your city's weather")
                .font(.custom("noteworthy",size: 15))
            
            HStack (alignment: .center) {
                
                Button(action: {    
                    controller.getWeatherData(url: FOUR_DAY_HOURLY_URL,
                                              parameters:
                                                ["q":userInput,"appid": APP_ID,"cnt": "3","units":"metric"]
                    )
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                }
                .padding(.leading, 3)
                .buttonStyle(CircleButtonStyleView())
                
                
                
                TextField("Search...",text: $userInput)
                    .padding(.leading, 5)
                
                Button(action: {
     
                }) {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 5)
                .buttonStyle(CircleButtonStyleView())
            
            }
            
            .frame(width: 300, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .shadow(color: .white, radius: 15, x: -10, y: -10)
                        .shadow(color: .black, radius: 15, x: 10, y: 10)
                        .blendMode(.overlay)
                    
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        
                        .fill(
                            Color.init(red: 255, green: 178, blue: 255, opacity: 1)
                        )
                        
                }
            )
            
            .foregroundColor(.primary)
        }
    }
}

struct SearchBoxView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBoxView()
    }
}

struct NeumorphicView: View {
    var bgColor: Color
    
    var body: some View {
        
        VStack {
            
            Button("Hello, Neumorphism!", action: {

            }).padding(20)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .shadow(color: .white, radius: 15, x: -10, y: -10)
                            .shadow(color: .black, radius: 15, x: 10, y: 10)
                            .blendMode(.overlay)
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            //.fill(Color.init(hex: "c9daf8"))
                            .fill(Color.red)
                    }
            )
            .foregroundColor(.primary)
        }
    }
}


extension Color {
    static let neuBackground = Color(hex: "f0f0f3")
    static let dropShadow = Color(hex: "aeaec0").opacity(0.4)
    static let dropLight = Color(hex: "ffffff")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}
