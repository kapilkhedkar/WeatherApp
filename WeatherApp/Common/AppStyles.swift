//
//  AppStyles.swift
//  WeatherApp
//
//  Created by Kapil Khedkar on 11/09/22.
//

import Foundation
import UIKit

enum FontStyle
{
    case navBarText
    case titleText
    case subtitleText
    case buttonText
    case blowedUpText
    case bodyTitleText
    case bodySubtitleText
    
}

enum AppColor
{
    case bgColor
    case itemBgColor
    case itemFontColor
    
}

class AppStyles
{
    static let itemCornerRadius : CGFloat = 8.0
    
    class func getFontStyle(style: FontStyle)->UIFont
    {
        switch style {
        case .navBarText:
            return UIFont(name: "Poppins-Medium", size: 20.0)!
        case .titleText:
            return UIFont(name: "Poppins-Medium", size: 16.0)!
        case .subtitleText:
            return UIFont(name: "Poppins-Light", size: 14.0)!
        case .buttonText:
            return UIFont(name: "Poppins-Medium", size: 20.0)!
        case .blowedUpText:
            return UIFont(name: "Poppins-Medium", size: 36.0)!
        case .bodyTitleText:
            return UIFont(name: "Poppins-Medium", size: 14.0)!
        case .bodySubtitleText:
            return UIFont(name: "Poppins-Light", size: 14.0)!
        }
        
    }
    
    class func getAppColor(color: AppColor)->UIColor
    {
        switch color {
        case .bgColor:
            return UIColor(named: "bgColor")!
        case .itemBgColor:
            return UIColor(named: "itemBgColor")!
        case .itemFontColor:
            return UIColor(named: "itemFontColor")!
        }
        
    }
    
}
