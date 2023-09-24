//
//  EditView.swift
//  Habitime
//
//  Created by Furkan Sarı on 24.09.2023.
//

import SwiftUI

struct EditView: View {
    @State var habitTitle: String
    @State var habitDesc: String
    @State var habitColor: Color = Color.red
    @State var habitHexColor: String
    @State var habitIcon: String
    @State var completedDay = Date()
    @State var selectedDays: [Int] = []
    @State var datePickerVisible = false
    @State var selectedCalendarDays = [Date]()
    var startDate: Date
    @State var habit: Habits?
    @State var completedDays: [Int] = []
    @State var controlIcon = "checkmark"
    @State var visiblePicker = false
    @Binding var selectedCalendarDates: [String]
    @State var habitDates: [String] = []
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15).background(Color.clear)
                .foregroundColor(Color.clear)
                .cornerRadius(20)
           
            VStack {
                HStack {
                    Rectangle().frame(width: 40, height: 40)
                        .cornerRadius(12)
                        .foregroundColor(habitColor.opacity(0.8))
                        .overlay {
                            Image(systemName: habitIcon)
                                .bold()
                                .imageScale(.large)
                                .foregroundColor(.white)
                                .frame(width: 25, height: 20)
                        }
                    
                    
                    VStack(alignment: .leading) {
                        Text(habitTitle).font(.title2)
                        Text(habitDesc).font(.system(size: 14)).fontWeight(.light)
                    }
                    
                    Spacer()
                  
                        
                }
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
                GeometryReader { geometry in
                    ScrollView(.horizontal) {
                        LazyVStack(spacing: -3) {
                            ForEach(0..<5, id: \.self) { rowIndex in
                                LazyHStack(spacing: 0) {
                                    ForEach(0..<73, id: \.self) { columnIndex in
                                        let dayNumber = rowIndex * 73 + columnIndex + 1
                                        let currentDate = Calendar.current.date(byAdding: .day, value: dayNumber - 1 , to: startDate)!
                                        
                                        DayGridCell(dayNumber: dayNumber, selectedDay: currentDate, stringColor: habitHexColor, selectedDays: $selectedDays, singleHabit: habit, selectedDates: $selectedCalendarDates, formatedDates: $habitDates)
                                            .frame(width: 18, height: 20)
                                            .background(Color.clear)
                                        
                                    }
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets(top: -22, leading: 20, bottom: 0, trailing: 0))
                    .frame(width: geometry.size.width - 20, height: geometry.size.height - 5)
                }
                
            }.onAppear {
                convertColor()
                
            }
        }
        .frame(width: 400, height: 170)
        .background(habitColor.opacity(0.4))
        
    }
    func convertColor() {
        guard let hexColor = Color(habitHexColor) else { return }
        habitColor = hexColor
    }
    
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(habitTitle: "", habitDesc: "", habitHexColor: "", habitIcon: "", startDate: Date(), selectedCalendarDates: .constant([]))
    }
}
