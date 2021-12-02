//
//  CityView.swift
//  Weather1.0
//
//  Created by Guest on 28.11.21.
//

import SwiftUI

struct CityView: View {
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        VStack{
            CityName(city: cityVM.city, date: cityVM.date)
                .shadow(radius:0)
            Today(cityVM: cityVM)
                .padding()
            Hour(cityVM: cityVM)
            Dailyy(cityVM: cityVM)
             
        }.padding(.bottom, 30)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
