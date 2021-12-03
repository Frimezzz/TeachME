//
//  ToDoApp.swift
//  ToDo
//
//  Created by Guest on 3.12.21.
//

import SwiftUI

@main
struct ToDoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
         ListView()
        }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel )
    }
}
}
