//
//  Subview.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 26/05/2021.
//

import SwiftUI

struct Subview: View {
    
    let height = UIScreen.main.bounds.height
    var body: some View {
        Spacer()
        
        RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(Color.offWhite)
            .frame(width: .infinity, height: height/2)

    }
}

struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        Subview()
    }
}
