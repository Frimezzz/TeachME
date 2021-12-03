//
//  NoItems.swift
//  ToDo
//
//  Created by Guest on 3.12.21.
//

import SwiftUI

struct NoItems: View {
    @State var animate: Bool = false
    var body: some View {
        ScrollView{
            VStack(spacing:15) {
                Text("No Task")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you Alive?Add some Task and Just Do It")
                    .padding(.bottom, 15)
                NavigationLink(
                    destination:
                        AddView(),
                    label:{
                    Text("Let's go🦁")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height:55)
                            .frame(maxWidth:.infinity)
                            .background(animate ? Color.red : Color.accentColor)
                            .cornerRadius(15)
                })
                    .padding(.horizontal, animate ? 30: 50)
                    .shadow(color:animate ? Color.red.opacity(0.6) : Color.accentColor.opacity(0.6),
                            radius:animate ? 30 : 10,
                            x: 0,
                            y:animate ? 50:30 )
                    .scaleEffect(animate ? 1.2 : 1.0)
                    .offset(y: animate ? -5 : 0)
                
            }
            .frame(maxWidth:400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame( maxWidth:.infinity, maxHeight:.infinity)
    }
    
    func addAnimation() {
        DispatchQueue.main.asyncAfter(deadline:.now() + 1.5) {
            withAnimation(
            Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItems_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItems()
                .navigationTitle("T")
        }
       
    }
}
