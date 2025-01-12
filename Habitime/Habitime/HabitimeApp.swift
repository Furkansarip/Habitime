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
    @AppStorage("themeMode") var themeMode: String = "light"
    @StateObject private var sharedData = HabitData()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, dataManager.container.viewContext)
                .environmentObject(iconStore)
                .environmentObject(sharedData)
            /*TrackerView() */
        }
    }
    
    func yearCheck() {
        let todayYear = Calendar.current.component(.year, from: Date()) // Örnek: 2025
        let nextYear = todayYear + 1
        print("Today", todayYear)
        print("Next Year", nextYear)
    }
}
