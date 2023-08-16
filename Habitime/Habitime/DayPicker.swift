//
//  DayPicker.swift
//  Habitime
//
//  Created by Furkan Sarı on 16.08.2023.
//

import SwiftUI

struct DayPicker: View {
   @State var days = ["Pzt", "Sal", "Çarş", "Perş", "Cum", "Cmt", "Paz"]
    @Binding var reminderText: String
    @Binding var isPresentedDay: Bool
    @State private var selectedTime = Date()
    var body: some View {
        VStack {
            HStack {
                ForEach(days, id: \.self) { day in
                    Button {
                        print("h")
                    } label: {
                        DayButton(dayName: day)
                    }.padding(.horizontal, -2)
                }
            }
           
            HStack(alignment: .center) {
                Button("Hepsini Seç") {
                    print("hello")
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
