//
//  SwiftUIView.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 24/05/2021.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {

        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
            .opacity(0.3)
            .ignoresSafeArea()

    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
