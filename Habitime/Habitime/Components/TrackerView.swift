import SwiftUI

struct DayGridCell: View {
    var dayNumber: Int
    let today = Date()
    @State var isSelected = false
    @State var selectedDay: Date
    @State var stringColor: String
    @State var componentColor: Color = .gray
    @Binding var selectedDays: [Int]
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
                if isSelected {
                    selectedDays.append(dayNumber)
                    print("True",selectedDays)// Seçilen günleri diziye ekleyin
                } else {
                    if let index = selectedDays.firstIndex(of: dayNumber) {
                        selectedDays.remove(at: index)
                        print("f",selectedDays)// Seçilen günleri diziye ekleyin// Seçilen günleri diziden kaldırın
                                            }
                }
            }
    }
    func convertColor() {
        guard let hexColor = Color(stringColor) else { return }
        componentColor = hexColor
    }
}

struct TrackerView: View {
    @State var habitTitle: String
    @State var habitDesc: String
    @State var habitColor: Color = Color.red
    @State var habitHexColor: String
    @State var habitIcon: String
    @State var completedDay = Date()
    @State var selectedDays: [Int] = []
    var startDate: Date
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15).background(Color.clear)
                .foregroundColor(Color.clear)
                .cornerRadius(20)
            
            VStack {
                HStack {
                    Rectangle().frame(width: 40, height: 43)
                        .cornerRadius(12)
                        .foregroundColor(habitColor)
                        .overlay {
                            Image(systemName: habitIcon)
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 25, height: 20)
                        }
                    
                    
                    VStack(alignment: .leading) {
                        Text(habitTitle)
                        Text(habitDesc)
                    }
                    
                    Spacer()
                    
                    Rectangle().frame(width: 40, height: 40)
                        .cornerRadius(12)
                        .foregroundColor(habitColor)
                        .overlay {
                            Button {
                                print(selectedDays)
                            } label: {
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 25, height: 20)
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25))
                }
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
                
                GeometryReader { geometry in
                    ScrollView(.horizontal) {
                        LazyVStack(spacing: 0) {
                            ForEach(0..<5, id: \.self) { rowIndex in
                                LazyHStack(spacing: 0) {
                                    ForEach(0..<73, id: \.self) { columnIndex in
                                        let dayNumber = rowIndex * 73 + columnIndex + 1
                                        let currentDate = Calendar.current.date(byAdding: .day, value: dayNumber - 1 , to: startDate)!
                                        
                                        DayGridCell(dayNumber: dayNumber, selectedDay: currentDate, stringColor: habitHexColor, selectedDays: $selectedDays)
                                            .frame(width: 20, height: 20)
                                            .background(Color.clear)
                                        
                                    }
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets(top: -22, leading: 20, bottom: 0, trailing: 0))
                    .frame(width: geometry.size.width - 10, height: geometry.size.height - 40)
                }
            }.onAppear {
                convertColor()
            }
        }
        .frame(width: 400, height: 235)
        .background(habitColor.opacity(0.2))
    }
    
    func convertColor() {
        guard let hexColor = Color(habitHexColor) else { return }
        habitColor = hexColor
        print("Date",startDate)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView(habitTitle: "Title", habitDesc: "Description", habitColor: .red, habitHexColor: "#f542d4", habitIcon: "gear", startDate: Date())
    }
}
