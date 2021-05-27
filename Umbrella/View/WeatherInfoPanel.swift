//
//  Subview.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 26/05/2021.
//

import SwiftUI

let viewWidth = UIScreen.main.bounds.width
let viewHeight = UIScreen.main.bounds.height

// MARK:- NON SELECTED PANEL

struct NoneSelectedPanel: View {


    var body: some View {

        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .foregroundColor(.offWhite)
            .border(Color.gray,width: 5)
            .opacity(0.5)
            .cornerRadius(30)
            .frame(width: viewWidth - 10 ,height: viewHeight/2)
            .padding()

        Text("No Data Added")
            .font(.custom("noteworthy",size: 15))

    }
}

// MARK:- INFO SELECTED PANEL
struct WeatherInfoPanel: View {
    var body: some View {
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(.offWhite.opacity(0.8))
                .border(Color.gray,width: 5)
                .opacity(0.5)
                .cornerRadius(30)
                .frame(width: viewWidth - 10 ,height: viewHeight/2)
                
        }
    }
}

struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoPanel()
    }
}
