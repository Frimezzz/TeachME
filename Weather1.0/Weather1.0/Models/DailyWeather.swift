//
//  DailyWeather.swift
//  Weather1.0
//
//  Created by Guest on 25.11.21.
//

import Foundation
struct Daily : Codable,Identifiable{
    var dt:Int
    var temp: Temperature
    var weather: [WeatherDetail]
    
enum CodingKey: String{
    case dt
    case temp
    case weather
}
    init(){
        dt = 0
        temp = Temperature(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }
}

extension Daily{
    var id: UUID{
        return UUID()
    
}
}
