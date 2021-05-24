//
//  HomeView.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 24/05/2021.
//

import SwiftUI
import SwiftyJSON
import Alamofire

class Controller {
    
    let WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "3c904a90e1b32e94a22ffdb510958557"
    
    func getWeatherData(url: String = "", parameters: [String: String] = ["":""]) {
        
        
        AF.request(WEATHER_URL, method: .get, parameters: ["q":"London","appid": APP_ID]).response { response in
        
        
            let returnedValue = response.data
            let weatherJSON: JSON = JSON(returnedValue)
            print("\n\n\n\(weatherJSON)\n\n\n")
            
            //self.updateWeatherData(json: weatherJSON)
            
           }
    }
}

struct HomeView: View {
    
    @State var userCityInput = ""
    let daysOfWeek = ["","","","","","",""]
    let viewWidth = UIScreen.main.bounds.width
    let viewHeight = UIScreen.main.bounds.height
    
    var body: some View {
        
        ZStack{
            
            // 1st Lay Background
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
                .opacity(0.3)
                .ignoresSafeArea()
            
        
                            
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                    Image(systemName: "list.bullet")
//                })
//                .frame(width: 50, height: 50)
//                .position(CGPoint(x: 10.0, y: 10.0))
//                .foregroundColor(.white)
                
            VStack(spacing: 20) {
                
                Text("Search for your city's weather")
                    .font(.custom("noteworthy",size: 15))
                
                SearchBoxView(userInput: "")
            
            }
            .frame(width: viewWidth, height: viewHeight,alignment: .top)
            .offset(y:50)
            
            
            
                
            VStack {
                
                Text("Today")
                
                Text("Monday")
                Image("sunny")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(width: 160, height: 160, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(20)
                
            }
            

            HStack{

                WeatherIconViewCell(day: daysOfWeek[0])
                WeatherIconViewCell(day: daysOfWeek[1])
                WeatherIconViewCell(day: daysOfWeek[2])
                WeatherIconViewCell(day: daysOfWeek[3])
                WeatherIconViewCell(day: daysOfWeek[4])
                WeatherIconViewCell(day: daysOfWeek[5])
                WeatherIconViewCell(day: daysOfWeek[6])
                    
                
            }
            .frame()
            .position(x : UIScreen.main.bounds.width/2,
                       y:  UIScreen.main.bounds.height*8/9)
        
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
