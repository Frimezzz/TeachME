//
//  Daily.swift
//  Weather1.0
//
//  Created by Guest on 29.11.21.
//

import SwiftUI

struct Dailyy: View {
    @ObservedObject var cityVM: CityViewViewModel
    var body: some View {
        ForEach(cityVM.weather.daily) { weather in
            LazyVStack{
                dailyyCell(weather: weather)
            }
        }
    }


private func dailyyCell(weather: Daily) -> some View{
    HStack {
        Text(cityVM.getDay(timestamp: weather.dt).uppercased())
            .frame(width:50)
        
        Spacer()
        
        Text("\(cityVM.getTemp(temp:weather.temp.max)) | \(cityVM.getTemp(temp:weather.temp.min))")
            .frame(width:150)
        Spacer()
        cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon: "sun.max.fill")
    }
    .foregroundColor(.white)
    .padding(.horizontal, 40)
    .padding(.vertical, 15)
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5),Color.blue]),startPoint:.top, endPoint:.bottom)))
}
}
struct Daily_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
