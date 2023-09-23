//
//  CalendarView.swift
//  Habitime
//
//  Created by Furkan Sarı on 10.09.2023.
//

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDates: [String]
    @State private var currentDate = Date()
    @State var dates: Set<DateComponents> = []
    @State var lastArray: [String] = []
    @State var selectedHabit: Habits?
    let formatter = DateFormatter()
    let calendar = Calendar.current
    var stringDate: [String] = []
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var habitData: HabitData
    @Environment(\.managedObjectContext) var managedObject
    var body: some View {
        NavigationView {
            VStack {
                MultiDatePicker("", selection: $dates, in: dateRange())
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                    .fixedSize()
                    .onChange(of: dates) { newValue in
                       formatSelectedDates()
                    }
            }
            
            .onAppear {
                convertedDates()
                
            }
            .navigationBarItems(trailing: Button("Kapat") {
                presentationMode.wrappedValue.dismiss()
            })
        }
        
    }

    private func formatSelectedDates() {
        
        formatter.dateFormat = "dd.MM.yyy"
        let dates = dates
            .compactMap { date in
                Calendar.current.date(from: date)
            }
            .map { date in
                formatter.string(from: date)
            }
        
        selectedDates = dates
        print("last", selectedDates)
        saveToCoreData(completedDays: selectedDates)
        
}
    
    func convertedDates() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let habitsArray = habitData.habitSavedArray
        var dateComponentsSet: Set<DateComponents> = Set()
        
        for dateString in habitsArray {
            if let date = dateFormatter.date(from: dateString) {
                let calendar = Calendar.current
                let dateComponents = calendar.dateComponents([.calendar, .era, .year, .month, .day], from: date)
                dateComponentsSet.insert(dateComponents)
                
            }
        }
        dates = dateComponentsSet
        
    }
    
    func dateRange() -> Range<Date> {
        let stringDate = selectedHabit?.habitDate ?? Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: stringDate)
       
        let start = calendar.date(
                    from: DateComponents(
                        year: components.year,
                        month: components.month,
                        day: components.day)
                )!
        return start..<Date.now
    }
    
    func saveToCoreData(completedDays: [String]) {
        selectedHabit?.formattedDates = completedDays
        do {
            try managedObject.save()
            
        } catch {
            print("Error saving to Core Data: \(error)")
        }
    }
    
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(selectedDates: .constant([]))
    }
}
