//
//  ProcrastiNationApp.swift
//  ProcrastiNation
//
//  Created by Silvio Saturno on 15/11/21.
//

import SwiftUI

@main
struct ProcrastiNationApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                
        }
    }
}
