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
    @State var formattedArrays: [String] = []
    @State var singleHabit: Habits?
    @State var completeAction = Date()
    @Binding var selectedDates: [String]
    @State var tempArray: [Date] = []
    @Binding var formatedDates: [String]
    @State var tempString: Set<String> = []
    @Environment(\.managedObjectContext) var managedObject
    var body: some View {
        RoundedRectangle(cornerRadius: 3)
            .stroke(componentColor, lineWidth: 1)
            .frame(width: 13, height: 13)
            .background(formatedDates.contains(selectedDay.getFormattedDate()) ? componentColor : .white)
            .onAppear {
                convertColor()
                
            }
            .onChange(of: selectedDates) { newValue in
                formattedDays()
            }
        
    }
    func convertColor() {
        guard let hexColor = Color(stringColor) else { return }
        componentColor = hexColor
    }
    
    func saveToCoreData(completedDays: [String]) {
        singleHabit?.formattedDates = completedDays
        do {
            try managedObject.save()
            
        } catch {
            print("Error saving to Core Data: \(error)")
        }
    }
     

    
    func formattedDays() {
        
        formatedDates = selectedDates
        saveToCoreData(completedDays: formatedDates)
    }
    
}

struct DayGridCell_Previews: PreviewProvider {
    
    static var previews: some View {
        DayGridCell(dayNumber: 0, selectedDay: Date(), stringColor: "#FFF", selectedDays: .constant([]), selectedDates: .constant([]), formatedDates: .constant([]))
    }
}
