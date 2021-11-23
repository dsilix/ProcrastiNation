//
//  ProcrastiNationApp.swift
//  ProcrastiNation
//
//  Created by Silvio Saturno on 15/11/21.
//

import SwiftUI

@main
struct ProcrastiNationApp: App {
    @State var landingopacity = 1.0
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear(perform: {
                    landingopacity = 0.0
                })
                .overlay(LandingView()
                            .opacity(landingopacity)
                            .animation(Animation.easeOut.delay(1.0))
                )
            
                
        }
    }
}
