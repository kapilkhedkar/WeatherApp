//
//  ApiManager.swift
//  WeatherApp
//
//  Created by Kapil Khedkar on 10/09/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiManager
{
    public static let shared = ApiManager()
    
    func getWeather(completion: @escaping () -> Void, cityName: String, delegate: WeatherViewModel)
    {
        AF.request(AppConstants.getCurrentWeatherAPI+cityName, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                
                print("JSON: \(json)")
                
                if json["error"].exists()
                {
                    let errorMsg = json["error"]["info"].stringValue
                    
                    delegate.responseStatus = .failure
                    delegate.failureMsg = errorMsg
                    
                    completion()
                    
                }else
                {
                    delegate.responseStatus = .success
                    
                    let requestJson = json["request"]
                    let cityName = requestJson["query"].stringValue
                    
                    let currentJson = json["current"]
                    let observationTime = currentJson["observation_time"].stringValue
                    let temperature = currentJson["temperature"].intValue
                    let weather_iconsJsonArray = currentJson["weather_icons"].arrayValue
                    var weatherIcon = ""
                    if weather_iconsJsonArray.count > 0
                    {
                        weatherIcon = weather_iconsJsonArray[0].stringValue
                        
                    }
                    
                    let weather_descriptionsJsonArray = currentJson["weather_descriptions"].arrayValue
                    var weatherDescription = ""
                    if weather_descriptionsJsonArray.count > 0
                    {
                        weatherDescription = weather_descriptionsJsonArray[0].stringValue
                        
                    }
                    
                    let windSpeed = currentJson["wind_speed"].intValue
                    let precipitation = currentJson["precip"].floatValue
                    let visibility = currentJson["visibility"].intValue
                    
                    let weatherObj = WeatherResponse(cityName: cityName, observationTime: observationTime, temperature: temperature, weatherIcon: weatherIcon, weatherDescription: weatherDescription, windSpeed: windSpeed, precipitation: precipitation, visibility: visibility)
                    
                    delegate.weatherData = weatherObj
                    
                    completion()
                    
                }
                
            case .failure(let error):
                print(error)
                
                delegate.responseStatus = .failure
                delegate.failureMsg = AppConstants.defaultApiFailureMsg
                
                completion()
                
            }
        }
        
    }
    
    
}
