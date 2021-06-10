//
//  7DaySnapShot.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 07/06/2021.
//

import SwiftUI

struct SnapShotView: View {
    var body: some View {
        
        GeometryReader { geometry in
            HStack (spacing: 0) {
                ForEach(0..<7) { _ in
                    VStack {
                        Text("Mon")
                        Image("sunny")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: geometry.size.width/7, height: 100)
                }
            }
            
            
            
        }
        .frame(width: 390,height: 100, alignment: .center)
        .cornerRadius(10)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(.offWhite.opacity(0.8))
                .border(Color.gray,width: 5)
                .opacity(0.5)
                .cornerRadius(30))
    }
}

struct SnapShot_Previews: PreviewProvider {
    static var previews: some View {
        SnapShotView()
            .padding(6.0)
    }
}
