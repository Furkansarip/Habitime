//
//  DayPicker.swift
//  Habitime
//
//  Created by Furkan Sarı on 16.08.2023.
//

import SwiftUI

struct DayPickerView: View {
    @State var days = Constant.days
    @State private var selectedTime = Date()
    @State private var selectedButtons: [String] = []
    @State var allSelected = false
    @State var defaultColor: Color = .gray.opacity(0.7)
    @State var changedColor: Color
    @Binding var reminderText: String
    @Binding var isPresentedDay: Bool
    @State var changeTime = Date()
    var body: some View {
        VStack {
            Text(reminderText)
            HStack {
                ForEach(days, id: \.self) { day in
                    Button {
                        allSelected = false
                        if selectedButtons.contains(day) {
                            selectedButtons.removeAll { $0 == day }
                        } else {
                            selectedButtons.append(day)
                            if selectedButtons.count == days.count {
                                allSelected = true
                            }
                        }
                        updateReminderText()
                        
                    } label: {
                        DayButton(dayName: day)
                            .background(selectedButtons.contains(day) ? changedColor : defaultColor)
                            .cornerRadius(10)
                            .padding(.horizontal, -1)
                    }.onChange(of: selectedButtons) { _ in
                        updateReminderText()
                    }
                    .padding(.horizontal, -2)
                    
                }
            }
            
            HStack(alignment: .center) {
                Button("Hepsini Seç") {
                    if selectedButtons.count == days.count {
                        selectedButtons.removeAll()
                        allSelected = false
                    } else {
                        selectedButtons = days
                        allSelected = true
                    }
                    updateReminderText()
                }.frame(minWidth: 110, minHeight: 30)
                    .background(allSelected ? changedColor : defaultColor)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .font(.headline)
                Spacer()
                DatePicker("Zaman Seç", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(.compact)
                    .onChange(of: selectedTime) { newValue in
                        updateReminderText()
                    }
            }.padding(.horizontal, 17)
            
            
            
        }.edgesIgnoringSafeArea(.bottom)
        
    }
    private func updateReminderText() {
        if allSelected {
            reminderText = "Everyday \(selectedTime.getCurrentTime())"
        } else {
            let selectedDaysText = selectedButtons.isEmpty ? "" : selectedButtons.joined(separator: ", ")
            if selectedButtons.isEmpty {
                reminderText = ""
            } else {
                reminderText = "\(selectedDaysText), \(selectedTime.getCurrentTime())"
            }
            
        }
        
    }
}

struct DayPicker_Previews: PreviewProvider {
    static var previews: some View {
        DayPickerView(changedColor: .pink, reminderText: .constant(""), isPresentedDay: .constant(false))
    }
}
