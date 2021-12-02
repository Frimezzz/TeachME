//
//   WeatherResponse.swift
//  Weather1.0
//
//  Created by Guest on 25.11.21.
//

import Foundation
struct WeatherResponce: Codable {
    var current: Weather
    var hourly: [Weather]
    var daily: [Daily]
    
    
    static func empty()->WeatherResponce {
        return WeatherResponce(current: Weather(), hourly: [Weather](repeating: Weather(), count: 23), daily: [Daily](repeating: Daily(), count: 8))
    }
     
}
