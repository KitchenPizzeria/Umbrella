//
//  SideMenuView.swift
//  Site-Seeing
//
//  Created by Joseph Meyrick on 06/05/2021.
//

import SwiftUI

struct SideMenuView: View  {
    
    @Binding var isShowing: Bool

    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                SideMenuHeaderView(isShowing: $isShowing)
                    .frame(height: 240)
                
                ForEach(0..<5) { _ in
                    SideMenuOptionView()
                }
                
                Spacer()
                
            }
            
            Spacer()
            
        }
        .navigationBarHidden(true)
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}
