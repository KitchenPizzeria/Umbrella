//
//  NeumorphicView.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 23/05/2021.
//

import SwiftUI

struct NeumorphicView: View {
    var body: some View {
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
    }
}

struct NeumorphicView_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicView()
    }
}
