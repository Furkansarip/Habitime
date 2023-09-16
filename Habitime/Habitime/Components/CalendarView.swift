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
    
    let calendar = Calendar.current
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                MultiDatePicker("", selection: $dates, in: ..<Date.now)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                    .fixedSize()
                    .onChange(of: dates) { newValue in
                        convertDateComponentsToDate(newValue)
                        
                    }
                
            }
            .navigationBarItems(trailing: Button("Kapat") {
                presentationMode.wrappedValue.dismiss()
            })
        }
      
    }
    func convertDateComponentsToDate(_ dateComponents: Set<DateComponents>) {
        selectedDates = dates
        
    }
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(selectedDates: .constant([]))
    }
}
