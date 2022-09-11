//
//  BaseViewModel.swift
//  WeatherApp
//
//  Created by Kapil Khedkar on 11/09/22.
//

import Foundation

class BaseViewModel: NSObject {
    override init() {
        super.init()
        callService()
    }

    public func callService() {
        // children should implement this
    }
}

