//
//  Connectivity.swift
//  WeatherApp
//
//  Created by Kapil Khedkar on 11/09/22.
//

import Foundation
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
