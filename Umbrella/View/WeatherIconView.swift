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
                        .border(Color.white, width: 1)
                        .cornerRadius(10)
                  
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)){
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
    
                    )

                }
            }
        }
//        .background(
//            
//            RoundedRectangle(cornerRadius: 30, style: .continuous)
//                    .foregroundColor(.clear)
//                    //.opacity(0.4)
//                    .border(Color.gray,width: 2)
//                    .cornerRadius(30)
//                    .frame(width: 410, height: 130)
//            
//        )
                 
        
//        .foregroundColor(.offWhite)
//        .border(Color.gray,width: 2)
//        .cornerRadius(30)
        
    }
}

struct WeatherIconViewCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIconViewStack(showMenu: .constant(true))
    }
}
