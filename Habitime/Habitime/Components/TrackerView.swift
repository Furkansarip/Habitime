import SwiftUI

struct TrackerView: View {
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
    @State var completedDays: [Int]
    @State var controlIcon = "checkmark"
    @Environment(\.managedObjectContext) var managedObject
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15).background(Color.clear)
                .foregroundColor(Color.clear)
                .cornerRadius(20)
            
            VStack {
                HStack {
                    Rectangle().frame(width: 40, height: 40)
                        .cornerRadius(12)
                        .foregroundColor(habitColor)
                        .overlay {
                            Image(systemName: habitIcon)
                                .imageScale(.large)
                                .foregroundColor(.white)
                                .frame(width: 25, height: 20)
                        }
                    
                    
                    VStack(alignment: .leading) {
                        Text(habitTitle).font(.title2)
                        Text(habitDesc).font(.system(size: 14)).fontWeight(.light)
                    }
                    
                    Spacer()
                    Rectangle().frame(width: 35, height: 35)
                        .cornerRadius(12)
                        .foregroundColor(habitColor.opacity(0.7))
                        .overlay {
                            Button {
                                print("Calendar")
                            } label: {
                                Image(systemName: "calendar")
                                    .bold()
                                    .imageScale(.medium)
                                    .foregroundColor(.white)
                                    .frame(width: 44, height: 44)
                            }
                        }
                        .onTapGesture {
                            print("calendar")
                        }
                        
                    
                    Rectangle().frame(width: 35, height: 35)
                        .cornerRadius(12)
                        .foregroundColor(habitColor.opacity(0.7))
                        .overlay {
                            Button {
                                print("Xmark")
                            } label: {
                                Image(systemName: "xmark")
                                    .bold()
                                    .imageScale(.medium)
                                    .foregroundColor(.white)
                                    .frame(width: 44, height: 44)
                            }
                        }.onTapGesture {
                            print("Xmark")
                        }
                    Rectangle().frame(width: 35, height: 35)
                        .cornerRadius(12)
                        .foregroundColor(habitColor.opacity(0.7))
                        .overlay {
                            Button {
                                print(selectedDays)
                            } label: {
                                Image(systemName: "\(controlIcon)")
                                    .bold()
                                    .imageScale(.medium)
                                    .foregroundColor(.white)
                                    .frame(width: 44, height: 44)
                            }
                        }.onTapGesture {
                            print("check")
                            selectedDays.append(5)
                            saveToCoreData(completedDays: selectedDays)
                            print(selectedDays.sorted())
                            
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
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
                                        
                                        DayGridCell(dayNumber: dayNumber, selectedDay: currentDate, stringColor: habitHexColor, selectedDays: $selectedDays, singleHabit: habit)
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
        .background(habitColor.opacity(0.2))
    }
    
    func convertColor() {
        guard let hexColor = Color(habitHexColor) else { return }
        habitColor = hexColor
        selectedDays = completedDays
    }
    
    func saveToCoreData(completedDays: [Int]) {
        habit?.completedDays = completedDays
        do {
            try managedObject.save()
            
        } catch {
            print("Error saving to Core Data: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView(habitTitle: "Title", habitDesc: "Description", habitColor: .red, habitHexColor: "#f542d4", habitIcon: "gear", startDate: Date(), completedDays: [])
    }
}
