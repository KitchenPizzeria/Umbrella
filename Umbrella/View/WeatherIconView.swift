//
//  WeatherIconViewCell.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 22/05/2021.
//

import SwiftUI

struct WeatherIconViewStack: View {
    
    let daysOfWeek = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    let controller = HomeViewController()
    
    @Binding var showMenu : Bool
    
    var body: some View {
        
        HStack {
            
            ForEach(daysOfWeek, id: \.self) { day in
                
                VStack(alignment: .center, spacing: 10) {
                    
                    Text(day.prefix(3))
                
                    Image(controller.getImageFromData())
                        .resizable()
                        .cornerRadius(15)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                        .border(Color.white, width: 1)
                        .cornerRadius(10)
                  
                    
                    Button(action: {
                        withAnimation(.spring()){
                            showMenu.toggle()
                        }
                    }, label: {
                    
                        Image(systemName: "chevron.down")
                            .padding(.bottom, 10)
                            .foregroundColor(.gray)
                            .padding(.top,10)

                    })
                    .background(
                        
                        Circle()
                        
                            .fill(Color.offWhite)
                            .frame(width: 25, height: 25)
                        
                           // .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            //.shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                           
                    )

                    
                    
                    
                }
                
                .frame(width: 50, height: 140, alignment: .bottom)
                //.background(Color.white.opacity(0.3))
                .cornerRadius(20.0)
            }
                
        }
            
//
//
//            daysOfWeek.forEach { day in
//
//                var WeatherCell = WeatherCellDataModel()
//                WeatherCell.day = day
//                WeatherCell.image = controller.CalculateImage()
//
//                VStack(alignment: .center, spacing: 10) {
//
//                    Text(day)
//
//                    Image(image)
//                        .resizable()
//                        .cornerRadius(15)
//                        .frame(width: 50, height: 50)
//                        .foregroundColor(.blue)
//                        .border(Color.white, width: 1)
//                        .cornerRadius(10)
//
//
//                    Button(action: {}, label: {
//
//                        Image(systemName: "chevron.down")
//                            .padding(.bottom, 10)
//                            .foregroundColor(.gray)
//                            .padding(.top,10)
//
//                    })
//                    .background(
//
//                        Circle()
//
//                            .fill(Color.offWhite)
//                            .frame(width: 25, height: 25)
//
//                           // .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
//                            //.shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
//
//                    )
//
//
//
//
//                }
//
//                .frame(width: 50, height: 140, alignment: .bottom)
//                //.background(Color.white.opacity(0.3))
//                .cornerRadius(20.0)
//
//
//
//
//
//            }
//
//        }
//
//        .background(
//
//            ZStack {
//                RoundedRectangle(cornerRadius: 30, style: .continuous)
//                    .shadow(color: .black, radius: 15, x: -10, y: -10)
//                    .shadow(color: .black, radius: 15, x: 10, y: 10)
//                    .blendMode(.overlay)
//
//                RoundedRectangle(cornerRadius: 30, style: .continuous)
//
//                    .fill(
//                        Color.init(red: 255, green: 178, blue: 255, opacity: 1)
//                        //Color.gray.opacity(0.4)
//                    )
//
//            }
//        )
//        .frame(width: 370, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
    }
}

struct WeatherIconViewCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIconViewStack(showMenu: .constant(true))
    }
}
