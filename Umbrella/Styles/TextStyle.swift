//
//  TextStyle.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 27/05/2021.
//

import SwiftUI

struct TextStyle: TextStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
}

struct TextStyle_Previews: PreviewProvider {
    static var previews: some View {
        TextStyle()
    }
}
