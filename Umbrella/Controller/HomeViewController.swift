//
//  ViewController.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 20/05/2021.
//


import CoreLocation
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    let ONE_CALL_URL = "https://api.openweathermap.org/data/2.5/onecall"
    let APP_ID = "f880910fee6908ccc2f2a676e203e5b6"
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    

    
    
    func getImageFromData() -> String {
        return "fog"
   
    }

    //MARK: - Networking
    
    func getWeatherData(lat: Double, lon: Double) {
        
        let parameters = ["lat":"\(lat)",
                      "lon":"\(lon)",
                      "exclude":"minutely,hourly,current,alerts",
                      "appid": APP_ID]
        
        let url = ONE_CALL_URL
        
        AF.request(url, method: .get, parameters: parameters).response { response in
        
            let returnedValue = response.data
            let weatherJSON: JSON = JSON(returnedValue as Any)
            
            print("\n\n\n\(weatherJSON["daily"][0])\n\n\n")
            
            //self.updateWeatherData(json: weatherJSON)
            
           }
        
    }
    
    //MARK: - JSON Parsing

    func updateWeatherData(json : JSON) {
    
        let tempResult = json["main"]["temp"].doubleValue
    
        weatherDataModel.temperature = Int(tempResult - 273.15)
    
        weatherDataModel.city = json["name"].stringValue

        weatherDataModel.condition = json["weather"][0]["id"].intValue

        weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)

        //updateUIWithWeatherData()
        
        }


    //MARK: - Location Manager Delegate Methods
    /***************************************************************/

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            
            self.locationManager.stopUpdatingLocation()
            
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            getWeatherData(lat: latitude, lon: longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        //Display label underneath with location unavailble
        //cityLabel.text = "Location Unavailable"
    }
 
}








