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
    
    let controller = HomeViewController()
    
    
    
    let viewWidth = UIScreen.main.bounds.width
    let viewHeight = UIScreen.main.bounds.height

    var body: some View {
        
        VStack {
            
            SearchBoxView(userInput: "")
                
            WeatherIconViewStack()
        
        
//            VStack {
//
//                Text("Today")
//                Text("Monday")
//                Image("sunny")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(20)
//                    .frame(width: 160, height: 160, alignment: .center)
//                    .background(Color.white)
//                    .cornerRadius(20)

            
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
