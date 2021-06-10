//
//  HomeView.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 24/05/2021.
//

import SwiftUI
import MapKit
import CoreLocation

struct HomeView: View {
    
    @State private var showWeatherInfoPanel = true
    @State private var cityHasBeenSelected = false
    
    @State private var CenterCoordinate = CLLocationCoordinate2D()
    @State private var userChosenlocation = [MKPointAnnotation]()
    
    let viewWidth = UIScreen.main.bounds.width
    let viewHeight = UIScreen.main.bounds.height
    
    
    @StateObject var mapData = MapViewModel()
    @StateObject var searchBox = SearchBoxViewModel()
    @StateObject var snapshotView = SnapshotViewModel()
    
    // Location Manager ..
    @State var locationManager = CLLocationManager()

    var body: some View {
    
        ZStack {
            
            MapView()
                .environmentObject(mapData)
                .ignoresSafeArea(.all)
                
            // Buttons to focus and change map
            VStack{
                SearchBoxView()
                    .environmentObject(mapData)
                    .environmentObject(searchBox)
                    .environmentObject(snapshotView)
                
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        mapData.focusLocation()
                    }, label: {
                        
                        Image(systemName: "location.fill")
                            .font(.title2)
                        
                    })
                    .padding()
                    .background(Color.offWhite)
                    .foregroundColor(.black.opacity(0.5))
                    .clipShape(Circle())
                    
                    
                    Button(action: {
                            mapData.updateMapType()
                    }, label: {
                        Image(systemName: mapData.mapType == .standard ? "network" : "map")
                            .font(.title )
                    })
                    .padding()
                    .background(Color.offWhite)
                    .foregroundColor(.black.opacity(0.5))
                    .clipShape(Circle())
                }
                .padding(.trailing, 10)
            }
            
            .onAppear(perform: {
                
                //Setting up delegate
                
                locationManager.delegate = mapData
                locationManager.requestWhenInUseAuthorization()
                
            })
            
            InformationPane()
                .environmentObject(snapshotView)
                .environmentObject(mapData)
                .offset(y: mapData.hideMapView ? 140 : 730)
            
            // Permission Denied Alert
            
            .alert(isPresented: $mapData.permissionDenied, content: {
                Alert(title: Text("PERMISSION DENIED"), message: Text("Please allow app to find your current location in settings"), dismissButton: .default(Text("Go To Settings"), action: {
                    
                    // Redirecting to Settings to change permissions
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                }))
            })
            .onChange(of: mapData.userCityInput, perform: {
                value in
                
                let delay = 0.1
                
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    if value == mapData.userCityInput {

                        self.mapData.searchQuery()
                    }
                }
                
            })
            
            
            
//            if mapData.citySelected == true {
//
//                withAnimation(.spring()) {
//
//
//                }
//            }
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

            
        
//            InformationPane(userCityInput:.constant(""), showWeatherInfoPanel: .constant(true), cityHasBeenSelected: .constant(true), hideMapView: .constant(true))
//
//                .offset(y: hideMapView ? 0:650)
            
            
//
//        }
//    }
//
//    func updateCenterCoord() {
//        CenterCoordinate.latitude = 35.8
//        CenterCoordinate.longitude = 104.1
//    }
//
//    func `if`<Content: View>( conditionalTrue: Bool, content: (Self) -> Content) -> some View {
//         if conditionalTrue {
//             return AnyView(content(self))
//         } else {
//             return AnyView(self)
//         }
//     }
//}
    

