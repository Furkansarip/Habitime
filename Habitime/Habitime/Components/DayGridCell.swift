//
//  DayGridCell.swift
//  Habitime
//
//  Created by Furkan Sarı on 9.09.2023.
//

import SwiftUI
import Combine

struct DayGridCell: View {
    var dayNumber: Int
    let today = Date()
    @State var isSelected = false
    @State var selectedDay: Date
    @State var stringColor: String
    @State var componentColor: Color = .gray
    @Binding var selectedDays: [Int]
    @State var singleHabit: Habits?
    @State var completeAction = Date()
    @Environment(\.managedObjectContext) var managedObject
    var body: some View {
        RoundedRectangle(cornerRadius: 3)
            .stroke(componentColor, lineWidth: 1)
            .frame(width: 13, height: 13)
            .background(selectedDays.contains(dayNumber) ? componentColor : .white)
            .onAppear {
                convertColor()
            }
            .onTapGesture {
                print("Today",today.getFormattedDate())
                print("DayNumber",dayNumber)
                print("SelectedDate ",selectedDay.getFormattedDate())
                isSelected.toggle()
                if selectedDays.contains(dayNumber) {
                    if let index = selectedDays.firstIndex(of: dayNumber) {
                        selectedDays.remove(at: index)
                        print("f",selectedDays)
                        saveToCoreData(completedDays: selectedDays)
                    }
                } else {
                    selectedDays.append(dayNumber)
                    saveToCoreData(completedDays: selectedDays)
                }
                func saveToCoreData(completedDays: [Int]) {
                    singleHabit?.completedDays = completedDays
                    do {
                        try managedObject.save()
                        
                    } catch {
                        print("Error saving to Core Data: \(error)")
                    }
                }
            }
        
    }
    func convertColor() {
        guard let hexColor = Color(stringColor) else { return }
        componentColor = hexColor
    }
}

struct DayGridCell_Previews: PreviewProvider {
    static var previews: some View {
        DayGridCell(dayNumber: 0, selectedDay: Date(), stringColor: "#FFF", selectedDays: .constant([]))
    }
}
