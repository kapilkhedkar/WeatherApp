//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Kapil Khedkar on 10/09/22.
//

import Foundation

class WeatherResponse
{
    var cityName : String?
    var observationTime : String?
    var temperature : Int?
    var weatherIcon : String?
    var weatherDescription : String?
    var windSpeed : Int?
    var precipitation : Float?
    var visibility : Int?
    
    //Parameterized Constructor
    init(cityName : String, observationTime : String, temperature : Int, weatherIcon : String, weatherDescription : String, windSpeed : Int, precipitation : Float, visibility : Int)
    {
        self.cityName = cityName
        self.observationTime = observationTime
        self.temperature = temperature
        self.weatherIcon = weatherIcon
        self.weatherDescription = weatherDescription
        self.windSpeed = windSpeed
        self.precipitation = precipitation
        self.visibility = visibility
        
    }
    
}
