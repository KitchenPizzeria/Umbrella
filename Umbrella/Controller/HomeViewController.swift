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
    
    let CURRENT_WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather"
    let SIXTEENDAY_WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather"
    let FOUR_DAY_HOURLY_URL = "https://pro.openweathermap.org/data/2.5/forecast/hourly"
    let APP_ID = "3c904a90e1b32e94a22ffdb510958557"
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("HERE")
        
        getWeatherData(url: SIXTEENDAY_WEATHER_URL, parameters: ["q":"london","APP_ID":APP_ID])
    
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    

    
    
    func getImageFromData() -> String {
        return "fog"
   
    }

    //MARK: - Networking
    
    func getWeatherData(url: String, parameters: [String: String]) {
        
        AF.request(url, method: .get, parameters: parameters).response { response in
        
            let returnedValue = response.data
            let weatherJSON: JSON = JSON(returnedValue as Any)
            
            print("\n\n\n\(weatherJSON)\n\n\n")
            
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
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params : [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            
            getWeatherData(url: CURRENT_WEATHER_URL, parameters: params)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        //Display label underneath with location unavailble
        //cityLabel.text = "Location Unavailable"
    }
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    func userEnteredANewCityName(city: String) {
        
        let params : [String : String] = ["q" : city, "appid" : APP_ID]
        getWeatherData(url: CURRENT_WEATHER_URL, parameters: params)
        
    }
    
    

    
    
}








