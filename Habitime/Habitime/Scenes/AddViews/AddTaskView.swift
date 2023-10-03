//
//  AddTaskView.swift
//  Habitime
//
//  Created by Furkan Sarı on 9.08.2023.
//

import SwiftUI
import Combine

class IconStore: ObservableObject {
    @Published var selectedIconName: String = ""
}

struct AddTaskView: View {
    @State var habitTitle: String = ""
    @State var habitDescription: String = ""
    @State var goalText: String
    @State var reminderText: String
    @State var selectedTitle: String = ""
    @State var colorPickerPresented = false
    @State var selectedIcon = ""
    @State private var goalPickerPresented = false
    @State private var dayPickerPresented = false
    @State private var iconPresented = false
    @State private var changedColor: Color = Color.pink
    @State private var selectedColor: Color = .indigo
    @State private var selectedOption = 0
    @State private var showingAlert = false
    @State private var showingErrorAlert = false
    @State private var showingSuccessAlert = false
    @State private var stringColor = "#5755D6"
    @State var hour = 0
    @State var min = 0
    @State var notificationDays = [Int]()
    @EnvironmentObject var iconStore: IconStore
    @Environment (\.managedObjectContext) var managedObj
    
    @Environment(\.presentationMode) var presentationMode
    var firstColorSet: [Color] = Constant.firstColorSet
    var secondColorSet: [Color] = Constant.secondColorSet
    var firstCategorySet: [String] = Constant.firstCategorySet
    var secondCategorySet: [String] = Constant.secondCategorySet
    var paddingValue: CGFloat = 22
    
    var body: some View {
        
        NavigationStack {
            ViewThatFits {
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Title").padding(EdgeInsets(top: 8, leading: paddingValue, bottom: 0, trailing: 0))
                            TextField("Habit Title", text: $habitTitle)
                                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                                .frame(height: 40)
                                .background(Color.gray.opacity(0.3).cornerRadius(10))
                                .font(.headline)
                                .padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: 22))
                            
                        }//Alışkanlık
                        VStack(alignment: .leading) {
                            Text("Description").padding(EdgeInsets(top: 8, leading: paddingValue, bottom: 0, trailing: 16))
                            
                            TextField("Habit Description", text: $habitDescription)
                                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                                .frame(height: 40)
                                .background(Color.gray.opacity(0.3).cornerRadius(10))
                                .font(.headline)
                                .padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: 22))
                        }//Açıklama
                        HStack {
                           /* VStack(alignment: .leading) {
                                Text("Hedef").padding(EdgeInsets(top: 8, leading: paddingValue, bottom: 0, trailing: 0))
                                TextField("Seçim Yapın", text: $goalText)
                                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                                    .frame(height: 40)
                                    .background(Color.gray.opacity(0.2).cornerRadius(10))
                                    .font(.headline)
                                    .padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: paddingValue))
                                    .onTapGesture {
                                        goalPickerPresented = true
                                        
                                    }.sheet(isPresented: $goalPickerPresented) {
                                        GoalPickerView(isSheetPresented: $goalPickerPresented, goalText: $goalText).presentationDetents([.fraction(0.35)])
                                            .presentationDragIndicator(.visible)
                                    }
                            }//Hedef */
                            VStack(alignment: .leading) {
                                Text("Reminder").padding(EdgeInsets(top: 8, leading: paddingValue, bottom: 0, trailing: 0))
                               TextField("Choose", text: $reminderText)
                                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                                    .frame(height: 40)
                                    .lineLimit(1)
                                    .background(Color.gray.opacity(0.2).cornerRadius(10))
                                    .padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: paddingValue))
                                    .onTapGesture {
                                        dayPickerPresented = true
                                        
                                    }.sheet(isPresented: $dayPickerPresented) {
                                        DayPickerView(changedColor: selectedColor, reminderText: $reminderText, isPresentedDay: $dayPickerPresented).presentationDetents([.fraction(0.35)])
                                            .presentationDragIndicator(.visible)
                                    }
                                
                            }
                        }// Hedef - Hatırlatma
                        VStack {
                            Text("Color")
                        }.padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: 0))
                        HStack {
                            
                            ForEach(firstColorSet, id: \.self) { color in
                                Button {
                                    changedColor = color
                                    
                                    withAnimation(Animation.easeInOut) {
                                        selectedColor = color
                                        stringColor = color.toHex() ?? ""
                                        print("COL", stringColor)
                                    }
                                    debugPrint(color)
                                } label: {
                                    ColorButton(singleColor: color).overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(selectedColor == color ? Color.black.opacity(0.4) : Color.clear, lineWidth: 4).padding(-4)
                                    )
                                }
                            }
                        }.padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: 0))//First color
                        HStack {
                            ForEach(secondColorSet, id: \.self) { color in
                                Button {
                                    changedColor = color
                                    
                                    withAnimation(Animation.easeInOut) {
                                        selectedColor = color
                                        stringColor = color.toHex() ?? ""
                                        
                                    }
                                    debugPrint(color)
                                } label: {
                                    ColorButton(singleColor: color).overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(selectedColor == color ? Color.black.opacity(0.4) : Color.clear, lineWidth: 3).padding(-4)
                                    )
                                }
                            }
                        }.padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: 0))//SEcond
                        HStack {
                            Spacer()
                            Text("Custom Color")
                            ColorPicker("", selection: $selectedColor)
                                .frame(width: 20)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                           
                            
                        }
                        // Özel Renk
                        VStack(alignment: .leading) {
                            
                            Text("Category").padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: 0))
                        }
                        VStack {
                            
                            HStack {
                                ForEach(firstCategorySet, id: \.self) { title in
                                    Button {
                                            selectedTitle = title
                                            print("taskview",selectedTitle)
                                            iconPresented = true
                                    } label: {
                                        CategoryButton(buttonTitle: title, buttonColor: $selectedColor)
                                    }.onChange(of: selectedTitle, perform: { newValue in
                                        if newValue != "" {
                                            iconPresented = true
                                            selectedIcon = iconStore.selectedIconName
                                        }
                                    })
                                    .sheet(isPresented: $iconPresented, onDismiss: {
                                        selectedIcon = iconStore.selectedIconName
                                    }) {
                                        IconPickerView(selectedIcon: Constant.IconSet(rawValue: selectedTitle) ?? .other, selectedColor: selectedColor, isPresented: $iconPresented)
                                            .presentationDetents([.fraction(0.3)])
                                            .presentationDragIndicator(.visible)
                                    }
                                    Spacer()
                                }
                            }.padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: 0))
                            
                            HStack {
                                ForEach(secondCategorySet, id: \.self) { title in
                                    Button {
                                        DispatchQueue.main.async {
                                            selectedTitle = title
                                            print("taskview",selectedTitle)
                                            iconPresented = true
                                            
                                        }
                                    } label: {
                                        CategoryButton(buttonTitle: title, buttonColor: $selectedColor)
                                        
                                    }.sheet(isPresented: $iconPresented, onDismiss: {
                                        selectedIcon = iconStore.selectedIconName
                                    }) {
                                        IconPickerView(selectedIcon: Constant.IconSet(rawValue: selectedTitle) ?? .other, selectedColor: selectedColor, isPresented: $iconPresented)
                                            .presentationDetents([.fraction(0.3)])
                                            .presentationDragIndicator(.visible)
                                       
                                    }
                                    Spacer()
                                }
                            }.padding(EdgeInsets(top: 0, leading: paddingValue, bottom: paddingValue, trailing: 0))
                            VStack {
                                HStack {
                                    Text("Selected Icon:")
                                    Image(systemName: selectedIcon.isEmpty ? "questionmark.circle.fill" : selectedIcon)
                                        .foregroundColor(selectedColor)
                                        .font(.system(size: 16))
                                    
                                }.padding(EdgeInsets(top: -5, leading: paddingValue, bottom: 13, trailing: 0))
                                Button("Add Habit") {
                                    if habitTitle.isEmpty || habitDescription.isEmpty || reminderText.isEmpty || iconStore.selectedIconName.isEmpty {
                                        showingAlert = true
                                        
                                    } else {
                                        CoreDataManager.shared.saveHabits(title: habitTitle, description: habitDescription, habitIcon: iconStore.selectedIconName, habitColor: stringColor, habitDate: Date(), context: managedObj)
                                        self.convertHourAndMin()
                                        self.daysControl()
                                        NotificationManager.shared.scheduleNotifications(notificationDays, hour: hour, minute: min, alertTitle: habitTitle)
                                        notificationDays = []
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                }.alert(isPresented: $showingAlert) {
                                    Alert(title: Text("Empty Section Error"), message: Text("Please fill requirements area."), dismissButton: .default(Text("OK")))
                                }
                                .frame(width: 350, height: 50)
                                .background(selectedColor)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .font(.system(size: 20))
                                .padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: paddingValue))
                                Spacer()
                            }
                            
                        } // Kategoriler
                        
                    }
                }
            }
            
            
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Image("logo")
            }
            
        }
        .offset()
    }
    
    func convertHourAndMin() {
        let components = reminderText.components(separatedBy: ", ")

        // Son bileşenin saati ve dakikası
        if let lastComponent = components.last,
            let hourAndMin = lastComponent.split(separator: " ").last {
            let hourAndMinComponents = hourAndMin.split(separator: ":")
            
            if hourAndMinComponents.count == 2 {
                hour = Int(hourAndMinComponents[0]) ?? 0
                min = Int(hourAndMinComponents[1]) ?? 0
                print("Saat: \(hour)")
                print("Dakika: \(min)")
            } else {
                print("Geçersiz saat formatı")
            }
        } else {
            print("Saat bilgisi bulunamadı")
        }
    }
    
    func daysControl() {
        if reminderText.contains("Everyday") {
            notificationDays = [1,2,3,4,5,6,7]
        } else {
            let daysString = reminderText.components(separatedBy: ", ")
            let daysArray = daysString.map { $0.capitalized }
            
            for singleDay in daysArray {
                if Constant.daysDictionary.keys.contains(singleDay) {
                    let value = Constant.daysDictionary[singleDay] ?? 0
                    notificationDays.append(value)
                    print("Notify:", notificationDays)
                }
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(goalText: "", reminderText: "", selectedTitle: "Besin")
    }
}
