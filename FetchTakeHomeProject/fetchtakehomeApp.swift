//
//  fetchtakehomeApp.swift
//  fetchtakehome
//
//  Created by Tyson Lefever on 2/4/25.
//

import SwiftUI

@main
struct fetchtakehomeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
