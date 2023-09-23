//
//  CoreDataManager.swift
//  Habitime
//
//  Created by Furkan Sarı on 23.08.2023.
//

import Foundation
import CoreData

final class CoreDataManager: ObservableObject {
    let container = NSPersistentContainer(name: "Habitime")
    static let shared = CoreDataManager()
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved!")
        } catch {
            print("Data failed")
        }
    }
    
    func saveHabits(title: String,
                description: String,
                goalText: String,
                habitIcon: String,
                habitColor: String,
                habitDate: Date,
                completedDays: [Int] = [],
                formatedDates: [String] = [],
                context: NSManagedObjectContext) {
        let habit = Habits(context: context)
        habit.habitTitle = title
        habit.habitDescription = description
        habit.goalText = goalText
        habit.habitIcon = habitIcon
        habit.habitColor = habitColor
        habit.habitDate = habitDate
        habit.completedDays = completedDays
        habit.formattedDates = formatedDates
        save(context: context)
    }
    
    func deleteHabit(context: NSManagedObjectContext) {
        
    }
}
