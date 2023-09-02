import SwiftUI

struct DayGridCell: View {
    var dayNumber: Int
    let today = Date()
    @State var isSelected = false
    @State var selectedDay: Date
    @State var stringColor: String
    @State var componentColor: Color = .gray
    var body: some View {
        RoundedRectangle(cornerRadius: 3)
            .stroke(componentColor, lineWidth: 1)
            .frame(width: 13, height: 13)
            .background(isSelected ? componentColor : .white)
            .onAppear {
               convertColor()
            }
            .onTapGesture {
                print("Today",today.getFormattedDate())
                print("DayNumber",dayNumber)
                print("SelectedDate ",selectedDay.getFormattedDate())
                if today.getFormattedDate() == selectedDay.getFormattedDate() {
                    isSelected.toggle()
                    print(dayNumber)
                }
            }
    }
    func convertColor() {
        guard let hexColor = Color(stringColor) else { return }
        componentColor = hexColor
    }
}

struct TrackerView: View {
    var startDate = Calendar.current.startOfDay(for: Date())
    @State var habitTitle: String
    @State var habitDesc: String
    @State var habitColor: Color = Color.red
    @State var habitHexColor: String
    @State var habitIcon: String
    @State var completedDay = Date()
    
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
                        
                    
                    VStack {
                        Text(habitTitle)
                        Text(habitDesc)
                    }
                    
                    Spacer()
                    
                    Rectangle().frame(width: 40, height: 40)
                        .cornerRadius(12)
                        .foregroundColor(habitColor)
                        .overlay {
                            Button {
                                print("dfdsf")
                            } label: {
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 25, height: 20)
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                }
                .padding(EdgeInsets(top: 25, leading: 20, bottom: 0, trailing: 0))
                
                GeometryReader { geometry in
                    ScrollView(.horizontal) {
                        LazyVStack(spacing: 0) {
                            ForEach(0..<5, id: \.self) { rowIndex in
                                LazyHStack(spacing: 0) {
                                    ForEach(0..<73, id: \.self) { columnIndex in
                                        let dayNumber = rowIndex * 73 + columnIndex + 1
                                        let currentDate = Calendar.current.date(byAdding: .day, value: dayNumber - 1 , to: startDate)!
                                        
                                        DayGridCell(dayNumber: dayNumber, selectedDay: currentDate, stringColor: habitHexColor)
                                            .frame(width: 20, height: 20)
                                            .background(Color.clear)
                                            
                                    }
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets(top: -15, leading: 20, bottom: 0, trailing: 0))
                    .frame(width: geometry.size.width - 10, height: geometry.size.height - 40)
                }
            }.onAppear {
                convertColor()
            }
        }
        .frame(width: 400, height: 235)
        .background(Color.clear)
    }
    
    func convertColor() {
        guard let hexColor = Color(habitHexColor) else { return }
        habitColor = hexColor
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView(habitTitle: "Title", habitDesc: "Description", habitColor: .red, habitHexColor: "#f542d4", habitIcon: "gear")
    }
}
