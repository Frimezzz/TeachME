//
//  Main.swift
//  Weather1.0
//
//  Created by Guest on 28.11.21.
//

import SwiftUI

struct Main: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    @State private var searcTerm = " San Francisco"
    var body: some View {
        HStack{
            TextField("", text: $searcTerm)
                .padding(.leading, 20)
            
            Button {
                cityVM.city = searcTerm
            }label : {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green)
                    
                    Image(systemName: "location.fill")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack( alignment: .leading){
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding()
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
        })
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
