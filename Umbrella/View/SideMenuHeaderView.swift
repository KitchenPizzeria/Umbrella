//
//  SideMenuHeaderView.swift
//  Site-Seeing
//
//  Created by Joseph Meyrick on 06/05/2021.
//

import SwiftUI

struct SideMenuHeaderView: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            Button(action: {
                withAnimation(.spring()){
                    isShowing.toggle()
                }
            }, label: {
                Image(systemName: "return")
                    .frame(width: 32, height: 32)
                    .foregroundColor(.black)
                    .padding()
            })
            
            
            
            VStack(alignment: .leading){
                Image("mapleleaf")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                
                Text("Profile Name")
                    .font(.system(size: 24.0, weight: .semibold))
                Text("SubHeader")
                    .font(.system(size: 14.0))
                    .padding(.bottom, 32)
                
                
                HStack(spacing: 12){
                    
                    HStack(spacing: 4){
                        Text("4.56").bold()
                        Text("Miles")
                    }
                    
                    HStack(spacing: 4){
                        Text("5.4").bold()
                        Text("Kilometres")
                    }
                    Spacer()
                }
                
                Spacer()
            }
            .padding()
            .foregroundColor(.black)
        }
        
    }
}
