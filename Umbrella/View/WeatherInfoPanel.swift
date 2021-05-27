//
//  Subview.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 26/05/2021.
//

import SwiftUI

let viewWidth = UIScreen.main.bounds.width
let viewHeight = UIScreen.main.bounds.height

struct NoneSelectedPanel: View {
    
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 30, style: .continuous)
            .foregroundColor(.clear)
            .border(Color.gray,width: 5)
            .opacity(0.5)
            .cornerRadius(30)
            .frame(width: viewWidth - 10 ,height: viewHeight/2)
            .padding()

        Text("No Data Added")
            .font(.custom("noteworthy",size: 15))
        
    }
}

struct WeatherInfoPanel: View {
    var body: some View {
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundColor(.offWhite)
                .border(Color.gray,width: 5)
                .cornerRadius(30)
                .frame(width: viewWidth - 10 ,height: viewHeight/2)
                .padding(5)
        }
        
        .offset(y:450)
        
        
        
        //.position(x:viewWidth/2,y:viewHeight+160)
        
//        Text("No Data Added")
//            .font(.custom("noteworthy",size: 15))
//
//            .background(
//
//                RoundedRectangle(cornerRadius: 30, style: .continuous)
//                    .stroke(lineWidth: 5)
//                    .cornerRadius(30)
//                    .foregroundColor(.offWhite)
//                    .frame(width: viewWidth - 10 ,height: viewHeight/2)
//
//
//
//
//
//            )
//

    }
}

struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoPanel()
    }
}
