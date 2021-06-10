import SwiftUI
import MapKit
import CoreLocation
import Alamofire
import SwiftyJSON

struct SearchBoxView: View {

    @EnvironmentObject var mapData: MapViewModel
    @EnvironmentObject var searchBox: SearchBoxViewModel
    
    
    var body: some View {
        
        VStack (spacing: 5) {

            Text("Search for your city's weather")
                .font(.custom("noteworthy",size: 15))
                .padding(.top, 5)
            
            VStack {
                
                HStack (alignment: .center) {
                    
                    //MARK: 1st Element in H Stack
                    
                    Button(action: {
                        
                        mapData.getCoordsOfUserInputtedCity()
                        mapData.userCityInput = ""
                        // show 7 day weather panel now
                    }){
                        Image(systemName: mapData.citySelected ? "arrow.uturn.left" : "magnifyingglass")
                    }
                    .padding(.leading, 10)
                    .buttonStyle(CircleButtonStyleView())
                    
                    
                    //MARK: 2nd Element in H Stack
                    TextField("Search...",text: $mapData.userCityInput)
                        .padding(.leading, 5)
                    
                    //MARK: 3rd Element in H Stack
                    Button(action: {
                        withAnimation(.spring()){mapData.hideMapView.toggle()}
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
                            .fill(Color.init(red: 255, green: 178, blue: 255, opacity: 1))
                    })
                .padding([.horizontal,.bottom])
                .foregroundColor(.primary)
                
            }
            
            .frame(height: searchBox.dropDownMenuActivated ? CGFloat(200) :CGFloat(50),alignment: .top)
            
//            if mapData.places.isEmpty && mapData.userCityInput != "" {
//                DropDownMenu()
//                    .environmentObject(mapData)
//                    .background(Color.white)
//                }
               

            if mapData.citySelected == true {
                Text("City Selected: \($searchBox.userInputtedCity.wrappedValue)")
                    .font(.custom("noteworthy",size: 15))
                Text("Latitude: \($mapData.Coordinates.latitude.wrappedValue) | Longitude: \($mapData.Coordinates.longitude.wrappedValue)")
                    .font(.custom("noteworthy",size: 15))
                    .padding(.bottom, 10)
            }
                
            
        }
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundColor(.offWhite.opacity(0.5))
                .border(Color.gray.opacity(0.5),width: 5)
                .cornerRadius(30))
    }
}

struct SearchBoxView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBoxView()
            .environmentObject(MapViewModel())
            .environmentObject(SearchBoxViewModel())

    }
}


// func populateSevenDaySnapshotStack() {
//
//        let days  = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
//
//        for x in 0..<7 {
//
//            let weatherDataIcon = WeatherIcon()
//            let button = DropDownButton()
//
//            let NumID = weatherDataJSON["daily"][x]["weather"][0]["id"].double!
//            let weather = weatherDataIcon.getWeatherIcon(condition: NumID)
//
//            weatherDataIcon.dayString = days[x]
//            weatherDataIcon.imageString = weather
//            weatherDataIcon.button = button
//
//            iconList.append(weatherDataIcon)
//        }
//
//        print(iconList)
//    }
//
//
//
//
//}
//

