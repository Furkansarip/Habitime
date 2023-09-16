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
    @State var result = false
    @State var isSelected = false
    @State var selectedDay: Date
    @State var stringColor: String
    @State var componentColor: Color = .gray
    @Binding var selectedDays: [Int]
    @State var formattedArrays: [String] = []
    @State var singleHabit: Habits?
    @State var completeAction = Date()
    @Binding var selectedDates: Set<Date>
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
                if selectedDay.getFormattedDate() == formattedArrays[0] {
                    print("hello")
                }
                print("SelectedDays:",selectedDays)
                
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
            }/*.onChange(of: selectedDates) { newValue in
                
                formattedDays(selectedDates)
            }*/
            
        
    }
    func convertColor() {
        guard let hexColor = Color(stringColor) else { return }
        componentColor = hexColor
    }
    
    func saveToCoreData(completedDays: [Int]) {
        singleHabit?.completedDays = completedDays
        do {
            try managedObject.save()
            
        } catch {
            print("Error saving to Core Data: \(error)")
        }
    }
    
    func formattedDays(_ array: [Date]) {
        for dates in array {
            let formattedDate = dates.getFormattedDate()
            if formattedDate == selectedDay.getFormattedDate() {
                print("Day Number:", dayNumber)
                formattedArrays.append(formattedDate)
                
                if selectedDays.contains(dayNumber) {
                    if let index = selectedDays.firstIndex(of: dayNumber) {
                        selectedDays.remove(at: index)
                        print("f",selectedDays)
                        //saveToCoreData(completedDays: selectedDays)
                    }
                } else {
                    selectedDays.append(dayNumber)
                    //saveToCoreData(completedDays: selectedDays)
                }
           
            }
        }
    }
    
    
}

struct DayGridCell_Previews: PreviewProvider {
    static var previews: some View {
        DayGridCell(dayNumber: 0, selectedDay: Date(), stringColor: "#FFF", selectedDays: .constant([]), selectedDates: .constant([]))
    }
}
