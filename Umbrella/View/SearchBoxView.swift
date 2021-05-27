//
//  SearchBoxView.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 23/05/2021.
//

import SwiftUI
import CoreLocation

var lat: Double = 0.00
var lon: Double = 0.00

struct SearchBoxView: View {
    
    let controller = HomeViewController()
    
    @State var userInput: String = ""
    @Binding var cityHasBeenSelected: Bool
    @Binding var hideMapView: Bool
    
    
    
    var body: some View {
        
        VStack (spacing: 5) {
        
            Text("Search for your city's weather")
                .font(.custom("noteworthy",size: 15))
                .padding(.top, 5)
            
            HStack (alignment: .center) {
                
                Button(action: {
                    
                    getCoordinateFrom(address: userInput) { coordinate, error in
                        
                      if error != nil {
                        
                        print("error retrieving coordinates")
                        
                      } else {
                        
                        
                        
                        lat = coordinate!.latitude
                        lon = coordinate!.longitude
                        
                        controller.getWeatherData(lat: lat, lon: lon)
                        
                        
                        withAnimation(.spring()) {
                       
                            cityHasBeenSelected.toggle()
      
                        }
                        
                        
                      }
                    }
                    
                }){
                    
                    if cityHasBeenSelected {
                        Image(systemName: "arrow.uturn.left")
                            .foregroundColor(.gray)
                    } else {
                    
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                    }
                    
                }
                .padding(.leading, 10)
                .buttonStyle(CircleButtonStyleView())
                
                
                
                TextField("Search...",text: $userInput)
                    .padding(.leading, 5)
                
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        
                        hideMapView.toggle()
                        
                    }
                     
                }) {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 10)
                .buttonStyle(CircleButtonStyleView())
            
            }
            
            
            .frame(width: 300, height: 35)
            .background(
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
        
            )
            .padding([.horizontal,.bottom])
            .foregroundColor(.primary)
            
            
            
            if cityHasBeenSelected {
                Text("City Selected: \(userInput)")
                    .font(.custom("noteworthy",size: 15))
                Text("Latitude: \(lat, specifier: "%.2f") | Longitude: \(lon, specifier: "%.2f")")
                    .font(.custom("noteworthy",size: 15))
                    .padding(.bottom, 10)
            }
            
            

        }
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundColor(.offWhite.opacity(0.5))
                .border(Color.gray.opacity(0.5),width: 5)
                .cornerRadius(30)
              

        )
    
    }
    
    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1) }
    }
    

}

struct SearchBoxView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBoxView(cityHasBeenSelected: .constant(true), hideMapView: .constant(true))
    }
}

struct NeumorphicView: View {
    var bgColor: Color
    
    var body: some View {
        
        VStack {
            
            Button("Hello, Neumorphism!", action: {

            }).padding(20)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .shadow(color: .white, radius: 15, x: -10, y: -10)
                            .shadow(color: .black, radius: 15, x: 10, y: 10)
                            .blendMode(.overlay)
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            //.fill(Color.init(hex: "c9daf8"))
                            .fill(Color.red)
                    }
            )
            .foregroundColor(.primary)
        }
    }
}


extension Color {
    static let neuBackground = Color(hex: "f0f0f3")
    static let dropShadow = Color(hex: "aeaec0").opacity(0.4)
    static let dropLight = Color(hex: "ffffff")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}
