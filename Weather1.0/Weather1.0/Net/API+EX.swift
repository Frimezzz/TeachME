//
//  API+EX.swift
//  Weather1.0
//
//  Created by Guest on 25.11.21.
//

import Foundation

extension API {
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    static func getUrlFor(lat:Double, lon:Double) -> String{
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exlude=minutely&appid=\(key)&units=metric"
    }
}
//https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=minutely,d
