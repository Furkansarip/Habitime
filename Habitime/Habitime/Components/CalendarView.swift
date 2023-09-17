//
//  CalendarView.swift
//  Habitime
//
//  Created by Furkan Sarı on 10.09.2023.
//

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDates: Set<DateComponents>
    @State var selectedTempDates: Set<Date> = []
    @State private var currentDate = Date()
    @State var dates: Set<DateComponents> = []
    @State var lastArray: [String] = []
    let formatter = DateFormatter()
    let calendar = Calendar.current
    var stringDate: [String] = []
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var habitData: HabitData
    var body: some View {
        NavigationView {
            VStack {
                MultiDatePicker("", selection: $dates, in: Date.now...)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                    .fixedSize()
                    .onAppear {
                        convertedDates()
                    }
                    .onChange(of: dates) { newValue in
                        formatSelectedDates()
                    }
                
            }
            .navigationBarItems(trailing: Button("Kapat") {
                presentationMode.wrappedValue.dismiss()
            })
        }
        
    }
    
    private func formatSelectedDates() {
        selectedDates = dates
        formatter.dateFormat = "dd.MM.yyy"
        let dates = selectedDates
            .compactMap { date in
                Calendar.current.date(from: date)
            }
            .map { date in
                formatter.string(from: date)
            }
        lastArray = dates
        print("saved Array", habitData.habitSavedArray)
        for dateObject in habitData.habitSavedArray {
            if !dates.contains(dateObject) {
                lastArray.append(dateObject)
                print("Eklendikten sonra: ", lastArray)
            } else {
                guard let index = lastArray.firstIndex(of: dateObject) else { return }
                lastArray.remove(at: index)
                print("Silindikten sonra: ", lastArray)
            }
        }
        
        
    }
    
    func convertedDates() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        var dateComponentsSet: Set<DateComponents> = Set()
        
        for dateString in habitData.habitSavedArray {
            print(dateString)
            if let date = dateFormatter.date(from: dateString) {
                let calendar = Calendar.current
                let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
                dateComponentsSet.insert(dateComponents)
                print("datescomp", dateComponentsSet)
            }
        }
        dates = dateComponentsSet
        print(dates)
    }
    
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(selectedDates: .constant([]))
    }
}
