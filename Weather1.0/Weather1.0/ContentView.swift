//
//  ContentView.swift
//  Weather1.0
//
//  Created by Guest on 25.11.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityVM = CityViewViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack(spacing: 0){
        Main(cityVM: cityVM)
                ScrollView(showsIndicators:false) {
                    CityView(cityVM: cityVM)
                }
            }.padding(.top, 30)
            
        }.background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5),Color.blue]),startPoint:.top, endPoint:.bottom)))
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
