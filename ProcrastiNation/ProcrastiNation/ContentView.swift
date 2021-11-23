//
//  ContentView.swift
//  ProcrastiNation
//
//  Created by Silvio Saturno on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var selectedItem = 1
    
    var body: some View {
        TabView(selection: $selectedItem) {
            ToDoList()
                .tabItem {
                    Image(systemName: "list.bullet.circle.fill")
                    Text("Todos")
                }.tag(0)
            Menu()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }.tag(1)
            Collection()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Collection")
                }.tag(2)
        }
        .accentColor(Color.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
