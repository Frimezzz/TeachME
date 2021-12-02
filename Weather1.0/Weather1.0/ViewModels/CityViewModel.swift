//
//  CityViewModel.swift
//  Weather1.0
//
//  Created by Guest on 25.11.21.
//

import SwiftUI
import CoreLocation

final class  CityViewViewModel: ObservableObject{
    @Published var weather = WeatherResponce.empty()
    
    @Published var city: String = "San Francisco" {
        didSet{
           getLocation()
        }
    }
    
    
    private lazy var dateFormater: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    
    
    private lazy var dayFormater:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        return formatter
    }()
    
    
    private lazy var timeFormater : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    
    init() {
        getLocation()
    }
    
    var date: String {
        return dateFormater.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
        
    }
    
    var weatherIcon: String {
        if  weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "ssss "
    }
    
    var conditions: String {
        if  weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return "clear "
    }
    var temperature: String {
        return getTemp(temp: weather.current.temp )
        
    }
    
    var windSpeed: String{
        return String(format: "%0.1f",weather.current.wind_speed)
    }
    
    var humidity: String {
        return String(format: "%d%%",weather.current.humidity)
    }
    var rainChances: String {
        return String(format: "%0.0f%%", weather.current.dew_point)
        
    }
    
    func getTime(timestamp: Int) -> String {
        return timeFormater.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    func getTemp(temp:Double) -> String{
        return String(format: "%0.1f", temp)
    }
    
    func getDay(timestamp:Int) -> String {
        return dateFormater.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemark, error) in
            if let places = placemark, let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }
    
    private func getWeather( coord: CLLocationCoordinate2D?){
        if let coord = coord{
             let urlString = API.getUrlFor(lat:coord.latitude,lon:coord.longitude)
                getWeatherIternal(city: city, for: urlString)
            }else{
                let urlString = API.getUrlFor(lat: 37.5485, lon: -121.886)
                getWeatherIternal(city: city, for: urlString)
        }
    }
    
    private func getWeatherIternal(city: String, for urlString: String){
        NetworManager<WeatherResponce>.fetch(fr: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let responce):
                DispatchQueue.main.async {
                    self.weather = responce
                }
                
            case .failure(let err ):
                print(err)
            }
    }
}
    func getLottieAnimation(icon:String) -> String {
        switch icon {
        case "01d":
            return "Sunny"
        case "01n":
            return "Sunny"
        case "02d":
            return "cloudy"
        case "02n":
            return "cloudy"
        case "03d":
            return "Cloudy"
        case "03n":
            return "cloudy"
        case "04d":
            return "cloudy"
        case "04n":
            return "Cloudy"
        case "09d":
            return "Rain"
        case "09n":
            return "Rain"
        case "10d":
            return "Rain"
        case "11d":
            return "dayThunderStorm"
        case "11n":
            return "nightThunderStorm"
        case "13d":
            return "snow"
        case "13n":
            return "snow"
        case "50d":
            return "dayMist"
        case "50n":
            return "nightMist"
        default:
            return "Rain"
        }
    }
    func getWeatherIconFor(icon:String) -> Image {
        switch icon {
        case "01d":
            return Image(systemName: "sun.max.fill")
        case "01n":
            return Image(systemName: "moon.fill")
        case "02d":
            return Image(systemName: "cloud.sun.fill")
        case "02n":
            return Image(systemName: "cloud.moon.fill")
        case "03d":
            return Image(systemName: "cloud.fill")
        case "03n":
            return Image(systemName: "cloud.fill")
        case "04d":
            return Image(systemName: "cloud.fill")
        case "04n":
            return Image(systemName: "cloud.fill")
        case "09d":
            return Image(systemName: "cloud.drizzle.fill")
        case "09n":
            return Image(systemName: "cloud.drizzle.fill")
        case "10n":
            return Image(systemName: "cloud.heavyrain.fill")
        case "10d":
            return Image(systemName: "cloud.heavyrain.fill")
        case "11d":
            return Image(systemName: "cloud.bolt.fill")
        case "11n":
            return Image(systemName: "cloud.bolt.fill")
        case "13d":
            return Image(systemName: "cloud.snow.fill")
        case "13n":
            return Image(systemName: "cloud.snow.fill")
        case "50d":
            return Image(systemName: "cloud.fog.fill")
        case "50n":
            return Image(systemName: "cloud.fog.fill")
        default:
            return Image(systemName: "sun.max.fill")
        }
    }
}
