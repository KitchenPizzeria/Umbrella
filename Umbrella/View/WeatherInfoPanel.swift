//
//  Subview.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 26/05/2021.
//

import SwiftUI
import SwiftyJSON

let viewWidth = UIScreen.main.bounds.width
let viewHeight = UIScreen.main.bounds.height



struct Property: Identifiable {
    var attribute: String = ""
    var id = UUID()
}

struct PropertyRow: View {
    
    var property: Property
    
    var body: some View {
        Text("property: \(property.attribute)")
    }
    
}

struct WeatherInfoPanel: View {
    
    @State private var propertyList : Array<Property>!

    var body: some View {
        
        VStack{
            
            // Upper H-Stack
            HStack (alignment: .top){
                
                // 1st List
                VStack(spacing: -20) {

                    ForEach(0..<6) { x in
                        Text("\(self.propertyList[x].attribute) - ")
                            .font(.custom("noteworthy",size: 15))
                    }
                    .frame(width: 100, height: 50)
                }
                .frame(width: 100, height: 214)
                
                // 2nd List
                VStack(spacing: -20) {

                    ForEach(7..<12) { x in
                        Text("\(self.propertyList[x].attribute)")
                            .font(.custom("noteworthy",size: 15))
                    }
                    .frame(width: 100, height: 50)
                }
                .frame(width: 100, height: 214)
                
                // 3rd List
                VStack(spacing: -20) {

                    ForEach(12..<16) { x in
                        Text("\(self.propertyList[x].attribute)")
                            .font(.custom("noteworthy",size: 15))
                    }
                    .frame(width: 100, height: 50)
                }
                .frame(width: 100, height: 214)

            }
            .frame(width: 390, height: 214)


            // lower H-Stack
            HStack{
                
                // 1st List
                VStack(spacing: -20) {

                    ForEach(7..<12) { x in
                        Text("\(propertyList[x].attribute)")
                            .font(.custom("noteworthy",size: 15))
                    }
                    .frame(width: 100, height: 50)
                }
                .frame(width: 100, height: 214)
                
                
                // 2nd List
                VStack(spacing: -20) {

                    ForEach(13..<16) { x in
                        Text("\(propertyList[x].attribute)")
                            .font(.custom("noteworthy",size: 15))
                    }
                    .frame(width: 100, height: 50)
                }
                .frame(width: 100, height: 214)

            }
            .frame(width: 390, height: 214)

        }
    
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(.offWhite.opacity(0.8))
                .border(Color.gray,width: 5)
                .opacity(0.5)
                .cornerRadius(30)
                .frame(width: viewWidth - 10 ,height: viewHeight/2))
    
    }
}

                    
//                    VStack {
//                        ForEach(3..<4) { x in
//                            Text("\(x) and \(propertyList[x].attribute)")
//                        }
//                    }
//
//                }
//                .frame(width: 150, height: 200)
                
//            }
//            .frame(width: 400, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//            .background(Color.orange.opacity(0.3))
            
//            ScrollView(.horizontal){
//                HStack {
//                    VStack {
//                        ForEach(0..<3) { x in
//                            Text("\(x) and \(propertyList[x].attribute)")
//                        }
//                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
//
//                        ForEach(3..<6) { x in
//                            Text("\(x) and \(propertyList[x].attribute)")
//                        }
//                    }
//                }
//                .frame(width: 150, height: 200)
//            }
//            .frame(width: 400, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//            .background(Color.red.opacity(0.3))
//        }
//        .background(
//
//            RoundedRectangle(cornerRadius: 20, style: .continuous)
//                .foregroundColor(.offWhite.opacity(0.8))
//                .border(Color.gray,width: 5)
//                .opacity(0.5)
//                .cornerRadius(30)
//                .frame(width: viewWidth - 10 ,height: viewHeight/2))
//        }
//    }


struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoPanel()
    }
}

