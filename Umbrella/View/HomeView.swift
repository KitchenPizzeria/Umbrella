//
//  HomeView.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 24/05/2021.
//

import SwiftUI



struct HomeView: View {
    
    @State var userCityInput = ""
    @State var isErrorHidden = true
    @State private var showWeatherInfoPanel = false
    
    let controller = HomeViewController()
    
    let viewWidth = UIScreen.main.bounds.width
    let viewHeight = UIScreen.main.bounds.height

    var body: some View {
    
        VStack {
            
            SearchBoxView(userInput: "")
                .padding(.top,70)
            
            Spacer()
            
            WeatherIconViewStack(showMenu: $showWeatherInfoPanel)
                
            ZStack{
                
                NoneSelectedPanel()
                
                if showWeatherInfoPanel {
                    
                    NoneSelectedPanel()
                        .offset(y:500)
                    
                    WeatherInfoPanel()
                        .offset(y: showWeatherInfoPanel ? -450: 0)
                    
                    
                    

                }
            }
            
                
            
        }
        .frame(width: viewWidth, height: viewHeight, alignment: .center)
        
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
                .opacity(0.3)
                .ignoresSafeArea()
        )
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
