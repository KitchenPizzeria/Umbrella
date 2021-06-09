//
//  SnapshotViewModel.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 08/06/2021.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class SnapshotViewModel: NSObject, ObservableObject {
    
    @Published var weatherJSON: JSON!
    
    func populateStack() {
        
    }
    
    func getWeatherData(lat: Double, lon: Double, city: String ) {
        
        let ONE_CALL_URL = "https://api.openweathermap.org/data/2.5/onecall"
        let APP_ID = "f880910fee6908ccc2f2a676e203e5b6"
        let parameters = ["lat":"\(lat)",
                      "lon":"\(lon)",
                      "exclude":"minutely,hourly,current,alerts",
                      "appid": APP_ID]
        
        AF.request(ONE_CALL_URL, method: .get, parameters: parameters).response { response in
        
            let returnedValue = response.data
            
            self.weatherJSON = JSON(returnedValue as Any)
            
            print("\n\n\n\(self.weatherJSON["daily"][0])\n\n\n")
            
            //self.updateWeatherData(json: weatherJSON)
            
           }
            
        
    }
    
}

