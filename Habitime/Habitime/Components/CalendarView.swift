//
//  CalendarView.swift
//  Habitime
//
//  Created by Furkan Sarı on 10.09.2023.
//

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDates: [String]
    @State var selectedTempDates: Set<Date> = []
    @State private var currentDate = Date()
    @State var dates: Set<DateComponents> = []
    @State var difDates: Set<String> = []
    @State var lastArray: [String] = []
    @State var startedCount = 0
    @State var newCount = 0
    @State var selectedHabit: Habits?
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
        
}
    
    func convertedDates() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        var dateComponentsSet: Set<DateComponents> = Set()
        
        for dateString in habitData.habitSavedArray {
            print(dateString)
            if let date = dateFormatter.date(from: dateString) {
                let calendar = Calendar.current
                let dateComponents = calendar.dateComponents([.calendar, .era, .year, .month, .day], from: date)
                dateComponentsSet.insert(dateComponents)
                
            }
        }
        dates = dateComponentsSet
        
    }
    
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(selectedDates: .constant([]))
    }
}
