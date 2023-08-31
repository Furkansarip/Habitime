import SwiftUI

struct DayGridCell: View {
    var dayNumber: Int
    let today = Date()
    @State var isSelected = false
    @State var selectedDay: Date
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .stroke(Color.gray, lineWidth: 2)
            .frame(width: 15, height: 15)
            .background(isSelected ? .green : .white)
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
}

struct TrackerView: View {
    var startDate = Calendar.current.startOfDay(for: Date())
    @State var habitTitle: String = "Title"
    @State var habitDesc: String = "Description"
    @State var habitColor: Color = .green
    @State var habitIcon: String = "gear"
    @State var completedDay = Date()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.white, lineWidth: 1)
                .padding()
            
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
                        LazyVStack(spacing: 4) {
                            ForEach(0..<5, id: \.self) { rowIndex in
                                LazyHStack(spacing: 8.5) {
                                    ForEach(0..<73, id: \.self) { columnIndex in
                                        let dayNumber = rowIndex * 73 + columnIndex + 1
                                        let currentDate = Calendar.current.date(byAdding: .day, value: dayNumber - 1 , to: startDate)!
                                        
                                        DayGridCell(dayNumber: dayNumber, selectedDay: currentDate)
                                            .frame(width: 20, height: 20)
                                    }
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .frame(width: geometry.size.width - 10, height: geometry.size.height - 40)
                }
            }
        }
        .frame(width: 400, height: 235)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
    }
}
