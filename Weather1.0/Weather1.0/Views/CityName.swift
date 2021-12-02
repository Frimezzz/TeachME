//
//  CityName.swift
//  Weather1.0
//
//  Created by Guest on 28.11.21.
//

import SwiftUI

struct CityName: View {
    
    var city: String
    var date: String
    
    var body: some View {
        HStack{
            VStack(alignment: .center, spacing:10) {
                Text(city)
                    .font(.title)
                    .bold()
                Text(date)
                
            }.foregroundColor(.white)
        }
    }
}

struct CityName_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
