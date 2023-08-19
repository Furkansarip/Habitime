//
//  DayPicker.swift
//  Habitime
//
//  Created by Furkan Sarı on 16.08.2023.
//

import SwiftUI

struct DayPicker: View {
    @State var days = Constant.days
    @State private var selectedTime = Date()
    @State var selectedButtons: Set<String> = []
    @State private var selectedButtonIndices: Set<String> = []
    
    @Binding var reminderText: String
    @Binding var isPresentedDay: Bool
    
    var body: some View {
        VStack {
            HStack {
                ForEach(days, id: \.self) { day in
                    Button {
                        selectedButtons.insert(day)
                        print(selectedButtons)
                        if selectedButtonIndices.contains(day) {
                            selectedButtonIndices.remove(day)
                            selectedButtons.remove(day)
                            reminderText = selectedButtons.joined(separator: ", ")
                        } else {
                            selectedButtonIndices.insert(day)
                            reminderText = "\(selectedButtons.joined(separator: ", ")) \(selectedTime.getCurrentTime())"
                        }
                        
                    } label: {
                        DayButton(dayName: day).background(selectedButtonIndices.contains(day) ? .pink : .gray.opacity(0.7)).cornerRadius(10)
                    }.padding(.horizontal, -2)
                    
                }
            }
            
            HStack(alignment: .center) {
                Button("Hepsini Seç") {
                    if selectedButtonIndices.count == days.count {
                        selectedButtonIndices.removeAll()
                        selectedButtons.removeAll()
                        reminderText = ""
                    } else {
                        selectedButtonIndices = Set(days)
                        selectedButtons = Set(days)
                        reminderText = "Everyday \(selectedTime.getCurrentTime())"
                    }
                }.frame(minWidth: 110, minHeight: 30)
                    .background(.red)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .font(.headline)
                Spacer()
                DatePicker("Zaman Seç", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(.compact)
            }.padding(.horizontal, 8)
            
            
            
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct DayPicker_Previews: PreviewProvider {
    static var previews: some View {
        DayPicker(reminderText: .constant(""), isPresentedDay: .constant(false))
    }
}
