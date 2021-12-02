//
//  Today.swift
//  Weather1.0
//
//  Created by Guest on 28.11.21.
//

import SwiftUI

struct Today: View {
    @ObservedObject var cityVM: CityViewViewModel
    var body: some View {
        VStack(spacing:10) {
        Text("Today")
            .font(.largeTitle)
            .bold()
        
     
        HStack(spacing: 20){
            LottieView(name: cityVM.getLottieAnimation(icon: cityVM.weatherIcon  ))
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading){
                Text("\(cityVM.temperature)℉")
                    .font(.system(size: 43))
                Text(cityVM.conditions)
            }
        }
            HStack{
                Spacer()
                widgetView(image: "wind", color: .green, title: "\(cityVM.windSpeed)")
                Spacer()
                widgetView(image: "drop.fill", color: .blue, title: "\(cityVM.humidity)")
                Spacer()
                widgetView(image: "umbrella.fill", color: .red, title: "\(cityVM.rainChances)")
                Spacer()
            }
    }
        .padding()
        .foregroundColor(.white)
        .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5),Color.blue]), startPoint: .top, endPoint: .bottom)))
    }
    private func widgetView(image:String, color: Color, title: String) -> some View{
        VStack {
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundColor(color)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            
            Text(title)
        }
    }
}

struct Today_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
