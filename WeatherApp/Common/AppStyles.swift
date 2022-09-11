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
    case itemShadowColor
    
}

class AppStyles
{
    class func getFontStyle(style: FontStyle)->UIFont
    {
        switch style {
        case .navBarText:
            return UIFont(name: "Inter-Bold", size: 20.0)!
        case .titleText:
            return UIFont(name: "Inter-Bold", size: 16.0)!
        case .subtitleText:
            return UIFont(name: "Inter-Regular", size: 14.0)!
        case .buttonText:
            return UIFont(name: "Inter-Bold", size: 20.0)!
        case .blowedUpText:
            return UIFont(name: "Inter-Bold", size: 24.0)!
        case .bodyTitleText:
            return UIFont(name: "Inter-Bold", size: 14.0)!
        case .bodySubtitleText:
            return UIFont(name: "Inter-Regular", size: 14.0)!
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
        case .itemShadowColor:
            return UIColor(named: "itemShadowColor")!
        }
        
    }
    
}
