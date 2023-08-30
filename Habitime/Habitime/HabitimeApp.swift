//
//  HabitimeApp.swift
//  Habitime
//
//  Created by Furkan Sarı on 9.08.2023.
//

import SwiftUI

@main
struct HabitimeApp: App {
    let dataManager = CoreDataManager.shared
    let iconStore = IconStore()
    var body: some Scene {
        WindowGroup {
            /*HomeView()
                .environment(\.managedObjectContext, dataManager.container.viewContext)
                .environmentObject(iconStore) */
            TrackerView()
        }
    }
}
