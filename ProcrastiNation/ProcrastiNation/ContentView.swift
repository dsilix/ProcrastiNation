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
           
            ToDoList()
                .tabItem {
                    Image(systemName: "list.bullet.circle.fill")
                    Text("Todos")
                }
            Menu()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Collection()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Collection")
                }
        }
        .accentColor(Color.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
