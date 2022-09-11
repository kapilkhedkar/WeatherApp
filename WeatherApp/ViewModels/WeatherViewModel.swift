//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Kapil Khedkar on 10/09/22.
//

import Foundation
import RappleProgressHUD
import KSToastView

class WeatherViewModel : BaseViewModel
{
    var isWeatherDataLoaded: ((WeatherResponse?, ApiResponseStatus, String) -> Void)?
    var responseStatus : ApiResponseStatus?
    var failureMsg : String?
    var weatherData : WeatherResponse?
    
    
    override func callService() {
        
        let cityName = CommonFunctions.getCityName()
        
        ApiManager.shared.getWeather(completion: {
            
            self.handleResponse(response: self.weatherData, status: self.responseStatus ?? .failure, failureMsg: self.failureMsg ?? "")
            
        }, cityName: cityName, delegate: self)
        
        
    }
    
    private func handleResponse(response: WeatherResponse?, status: ApiResponseStatus, failureMsg: String) {
        if let isWeatherDataLoaded = self.isWeatherDataLoaded {
            isWeatherDataLoaded(response, status, failureMsg)
        }
    }
    
    func numberOfRows()->Int
    {
        let cityName = CommonFunctions.getCityName()
        if cityName.isEmpty
        {
            return 0
            
        }else
        {
            return 1
            
        }
        
    }
    
    
}
