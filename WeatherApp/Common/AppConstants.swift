//
//  AppConstants.swift
//  WeatherApp
//
//  Created by Kapil Khedkar on 10/09/22.
//

import Foundation
class AppConstants
{
    static let apiBaseUrl = "http://api.weatherstack.com/"
    static let apiAccessKey = "fef7cc19fde848cc7bf22a3158a07504"
    static let getCurrentWeatherAPI = apiBaseUrl+"current?access_key="+apiAccessKey+"&query="
    
    static let defaultApiFailureMsg = "Something went wrong!"
    static let noInternetMsg = "No Internet Connection!"
    
    static let windSpeedUnit = "m/h"
    static let visibilityUnit = "m"
    static let precipitationUnit = "mm"
    
    static let themeModeDark = "Dark"
    static let themeModeLight = "Light"
    
    static let languageEnglish = "en"
    static let languageHindi = "hi"
    
    static let prefKeyThemeMode = "PrefKeyThemeMode"
    static let prefKeyLanguage = "PrefKeyLanguage"
    static let prefKeyCityName = "PrefKeyCityName"
    
}
