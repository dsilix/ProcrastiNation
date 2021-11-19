//
//  ContentView.swift
//  ProcrastiNation
//
//  Created by Silvio Saturno on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        TabView {
            Menu()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            ToDoList()
                .tabItem {
                    Image(systemName: "list.bullet.circle.fill")
                    Text("Todos")
                }
            Collection()
                .tabItem {
                    Image(systemName: "list.bullet.circle.fill")
                    Text("Collection")
                }
        }
        .accentColor(Color.indigo)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
