//
//  Hour.swift
//  Weather1.0
//
//  Created by Guest on 28.11.21.
//

import SwiftUI

struct Hour: View {
    @ObservedObject var cityVM: CityViewViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(cityVM.weather.hourly) { weather in
                let icon = cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ?
                weather.weather[0].icon:  "sun.max.fill")
                let hour = cityVM.getTime(timestamp: weather.dt)
                let temp = cityVM.getTemp(temp: weather.temp)
                    getHourlyView(hour: hour, image: icon, temp: temp)
            }
        }
        
    }
}

    private func getHourlyView(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing:20){
            Text(hour)
            image
                .foregroundColor(.yellow)
            Text(temp)
            
        }
        .foregroundColor(.white)
        .padding()
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5),Color.blue]),startPoint:.top, endPoint:.bottom)))
    }
}


struct Hour_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

