//
//  InformationPane.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 27/05/2021.
//

import SwiftUI

struct InformationPane: View {
    
    @EnvironmentObject var snapshot: SnapshotViewModel
    @EnvironmentObject var mapData: MapViewModel
    
    @State private var offset = CGSize.zero
    
    var body: some View {
        VStack (spacing: 0) {
            
            SnapShotView()
            
            WeatherInfoPanel()
            
        }
        .onAppear {
            if mapData.citySelected {
                print("This will display the 7 icons")
            } else {
                print("This is will show the no city selected message")
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    self.offset = value.translation
                }
                .onEnded { value in
                    self.offset = CGSize.zero
                }
        )
        
        .offset(y: self.offset.height)
        
        
            
//            perform: {
//                snapshot.populateSevenDaySnapshotStack()
//            }
        
        
        .frame(width: UIScreen.main.bounds.width - 10,
               height: UIScreen.main.bounds.height / 2,
               alignment: .top)
        .padding(.top, 20)
        .background(Color.offWhite.opacity(0.3))
        .cornerRadius(30)
        
        
    }
}

            
//            .onAppear {
//                // will populate 7 day stack for
//                mapData.getWeatherData
//                snapshot.populateSevenDaySnapshotStack
//            }
//  .frame(width: 400, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//            .overlay(
//                ZStack{
//                    RoundedRectangle(cornerRadius: 30, style: .continuous)
//                        .foregroundColor(.offWhite.opacity(1))
//                        .border(Color.gray.opacity(0.5),width: 5)
//                                .cornerRadius(30)
//
//                            Text("No city selected")
//                                .font(.custom("noteworthy",size: 15))
//                        })
//            if showWeatherInfoPanel {
//                WeatherInfoPanel()
//                    .overlay(
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 20, style: .continuous)
//                                .foregroundColor(.offWhite)
//                                .border(Color.gray,width: 5)
//                                .opacity(0.5)
//                                .cornerRadius(30)
//                                .frame(width: viewWidth - 10 ,height: viewHeight/2)
//                                .padding()
//
//                            Text("No Data Added")
//                                .font(.custom("noteworthy",size: 15))
//                        })
//                    //.offset(y: showWeatherInfoPanel ? 0: 0)
//                    .offset(y:200)
//            }
//
 
struct InformationPane_Previews: PreviewProvider {
    static var previews: some View {
        InformationPane()
            .environmentObject(SnapshotViewModel())
            .environmentObject(MapViewModel())
    }
}
