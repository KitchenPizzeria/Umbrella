//
//  WeatherIconViewCell.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 22/05/2021.
//

import SwiftUI

//todo: Construct Days of week array

struct WeatherIconViewStack: View {
    
    let controller = HomeViewController()
    
    var days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    @Binding var showMenu : Bool
    @Binding var userInput : String
    @Binding var cityHasBeenSelected: Bool
    
    var body: some View {
        
        VStack (spacing: 15) {
            
            HStack {
                
                ForEach(days, id: \.self) { day in
                    
                    VStack(alignment: .center, spacing: 10) {
                        
                        Text(day.prefix(3))
                    
                        Image(controller.getImageFromData())
                            .resizable()
                            .cornerRadius(15)
                            .frame(width: 40, height: 40)
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
                                .frame(width: 25, height: 25))
                    }
                    .padding(.horizontal,2)
                    
                    
                }
                .frame(width: 51, height: 150)
            }
            
            .background(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundColor(.offWhite.opacity(0.8))
                    .border(Color.gray.opacity(0.5),width: 5)
                    .cornerRadius(30)
                  

            )
        }
        
        
    }
    
//    func shiftDayArray(days : [String]) {
//
//        days.append(days[0])
//        days.remove(at: 0)
//
//    }
}

struct WeatherIconViewCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIconViewStack(showMenu: .constant(true),
                             userInput: .constant(""),
                             cityHasBeenSelected: .constant(true)
        )
    }
}
