//
//  Platoon_Team_ManagerApp.swift
//  Platoon Team Manager
//
//  Created by Jakub Chodara on 07/03/2023.
//

import SwiftUI

@main
struct Platoon_Team_ManagerApp: App {
    let persistanceContainer = PersistanceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistanceContainer.containter.viewContext )
        }
    }
}
