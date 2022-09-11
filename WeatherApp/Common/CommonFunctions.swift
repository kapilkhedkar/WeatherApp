//
//  CommonFunctions.swift
//  WeatherApp
//
//  Created by Kapil Khedkar on 11/09/22.
//

import Foundation

class CommonFunctions
{
    class func setThemeMode(mode: String)
    {
        let defaults = UserDefaults.standard
        defaults.set(mode, forKey: AppConstants.prefKeyThemeMode)
        defaults.synchronize()
        
    }
    
    class func getThemeMode()->String
    {
        var mode : String = AppConstants.themeModeLight
        
        let defaults = UserDefaults.standard
        if defaults.string(forKey: AppConstants.prefKeyThemeMode) != nil
        {
            mode = defaults.string(forKey: AppConstants.prefKeyThemeMode) ?? AppConstants.themeModeLight
            
        }
        
        return mode
        
    }
    
    class func setLanguage(language: String)
    {
        let defaults = UserDefaults.standard
        defaults.set(language, forKey: AppConstants.prefKeyLanguage)
        defaults.synchronize()
        
    }
    
    class func getLanguage()->String
    {
        var language : String = AppConstants.languageEnglish
        
        let defaults = UserDefaults.standard
        if defaults.string(forKey: AppConstants.prefKeyLanguage) != nil
        {
            language = defaults.string(forKey: AppConstants.prefKeyLanguage) ?? AppConstants.languageEnglish
            
        }
        
        return language
        
    }
    
    class func setCityName(city: String)
    {
        let defaults = UserDefaults.standard
        defaults.set(city, forKey: AppConstants.prefKeyCityName)
        defaults.synchronize()
        
    }
    
    class func getCityName()->String
    {
        var city : String = ""
        
        let defaults = UserDefaults.standard
        if defaults.string(forKey: AppConstants.prefKeyCityName) != nil
        {
            city = defaults.string(forKey: AppConstants.prefKeyCityName) ?? ""
            
        }
        
        return city
        
    }
    
}
