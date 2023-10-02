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
    @State var stringColor = ""
    @State var componentColor : Color = .red
    let formatter = DateFormatter()
    let calendar = Calendar.current
    var stringDate: [String] = []
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var habitData: HabitData
    @Environment(\.managedObjectContext) var managedObject
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                //
               
                EditView(habitTitle: selectedHabit?.habitTitle ?? "Title", habitDesc: selectedHabit?.habitDescription ?? "Desc", habitHexColor: selectedHabit?.habitColor ?? "#FFF", habitIcon: selectedHabit?.habitIcon ?? "plus", startDate: selectedHabit?.habitDate ?? Date(), selectedCalendarDates: $selectedDates, habitDates: selectedDates)
                
                //
                MultiDatePicker("", selection: $dates, in: dateRange())
                    .datePickerStyle(.graphical)
                    .labelsHidden()
                    .onChange(of: dates) { newValue in
                       formatSelectedDates()
                        //selectedHabit?.formattedDates = selectedDates
                    }
            }
         
            
            .onAppear {
                convertColor()
                convertedDates()
                
            }
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark.circle").foregroundColor(componentColor)
                    .bold()
                    
            }))
            .backgroundStyle(.clear)
            
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
    func convertColor() {
        stringColor = selectedHabit?.habitColor ?? "#FFF"
        guard let hexColor = Color(stringColor) else { return }
        
        componentColor = hexColor
        
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
