//
//  NMCircleSearchButton.swift
//  
//
//  Created by Joseph Meyrick on 24/05/2021.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}


struct CircleButtonStyleView: ButtonStyle {
    
    @State var width: CGFloat = 30
    @State var height: CGFloat = 30
    
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .frame(width: width, height: height, alignment: .center)
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        
                    }
                }
            )
    }
}


struct SearchButtonView: View {
    
    var bgColor: Color = Color.offWhite
    
    @State private var isPressed: Bool = false
//    @State var width: CGFloat = 100
//    @State var height: CGFloat = 100
        
    
    var body: some View {
        ZStack{
            
            Color.offWhite
            
            Button(action: {
                self.isPressed.toggle()
            }, label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            })
            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

            .scaleEffect(self.isPressed ? 0.98: 1)
            .foregroundColor(.primary)
            .animation(.spring())
            .buttonStyle(
                CircleButtonStyleView(
                    //width: width, height: height
                )
            )
        }
        .ignoresSafeArea()
        
    }
}

struct ButtonStyleView_Previews: PreviewProvider {
    static var previews: some View {
        SearchButtonView()
    }
}

