//
//  SideMenuOptionView.swift
//  Site-Seeing
//
//  Created by Joseph Meyrick on 06/05/2021.
//

import SwiftUI

struct SideMenuOptionView: View {
    
    var body: some View {
        
        HStack(alignment: .center,spacing: 16){
            
            Image(systemName: "person")
                .frame(width: 24, height: 24)
            
            Text("Profile")
                .font(.system(size: 14,weight: .semibold))
            
            Spacer()
            
        }
        
        .padding()
        .foregroundColor(.black)

    }
}
