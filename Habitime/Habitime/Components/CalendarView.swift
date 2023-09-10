//
//  CalendarView.swift
//  Habitime
//
//  Created by Furkan Sarı on 10.09.2023.
//

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDates: [Date]
    @State private var currentDate = Date()
    @State var dates: Set<DateComponents> = []
    let calendar = Calendar.current
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                /*DatePicker("Tarih Seç", selection: $currentDate, in: ...Date(), displayedComponents: .date)
                 .datePickerStyle(GraphicalDatePickerStyle())
                 .labelsHidden()
                 .onChange(of: currentDate) { newValue in
                 print(newValue)
                 selectedDates.append(newValue)
                 
                 } */
                MultiDatePicker("", selection: $dates, in: ..<Date.now)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                    .fixedSize()
                    .onChange(of: dates) { newValue in
                        print(newValue)
                        for singleDate in newValue {
                            if let date = calendar.date(from: singleDate) {
                                selectedDates.append(date)
                                print(selectedDates)
                            }
                        }
                    }
            }
            .navigationBarItems(trailing: Button("Kapat") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(selectedDates: .constant([]))
    }
}
