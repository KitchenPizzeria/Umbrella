//
//  WeatherPaneInfo.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 28/05/2021.
//

import SwiftUI

//struct Property: Identifiable {
//    var attribute: String = ""
//    var id = UUID()
//}

protocol PropertyLoopable {
    func allProperties() -> [String]
}

extension PropertyLoopable {
    func allProperties() -> [String] {

        var result = [String]()

        let mirror = Mirror(reflecting: self)

//        // Optional check to make sure we're iterating over a struct or class
//        guard let style = mirror.displayStyle, style == .struct || style == .class else {
//            throw NSError()
//        }

        for (property, _) in mirror.children {
            guard let property = property else {
                continue
            }

            result.append(property)
        }

        return result
    }
}



struct WeatherPaneInfo: PropertyLoopable {
    static let instance = WeatherPaneInfo()

    // UNIX DATA TYPES (Clock Section)
    var dt: Int = 0
    var sunrise: Int = 0
    var sunset: Int = 0
    var moonrise: Int = 0
    var moonset: Int = 0
    
   // Moon phase. 0 and 1 are 'new moon', 0.25 is 'first quarter moon', 0.5 is 'full moon' and 0.75 is 'last quarter moon'. The periods in between are called 'waxing crescent', 'waxing gibous', 'waning gibous', and 'waning crescent', respectively.
    var moon_phase: Double = 0
    
    //daily.temp Units  metric: Celsius, imperial: Fahrenheit.
    var tempMin: Double = 0
    var tempMax: Double = 0
    var tempNight: Double = 0
    var tempMorn: Double = 0
    var tempDay: Double = 0
    var tempEve: Double = 0
    
    //This accounts for human perception of weather
    var feels_like_night: Double = 0
    var feels_like_morn: Double = 0
    var feels_like_eve: Double = 0
    var feels_like_day: Double = 0
    

    //daily.wind_speed : metric: metre/sec, imperial: miles/hour.
    //daily.wind_gust : metric: metre/sec, imperial: miles/hour
    //daily.wind_deg Wind direction, degrees (meteorological)
    var windGust: Double = 0
    var windDirection: Int = 0
    var windSpeed: Double = 0
    
    //Atmospheric pressure on the sea level, hPa
    var pressure: Int = 0
    //Humidity, %
    var humidity: Int = 0
    
    //daily.dew_point Atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
    var dew_point: Double = 0
    

   // daily.clouds Cloudiness, %
    var clouds: Double = 0
    //daily.uvi The maximum value of UV index for the day
    var uvi: Double = 0
    //daily.pop Probability of precipitation
    var pop: Double = 0
    
    var weatherDescription: String = ""
    
    
    

    func convertUnixToTime(unixTime: Int){
        
        print(NSDate(timeIntervalSince1970: TimeInterval(unixTime)))
        
    }
   
}

