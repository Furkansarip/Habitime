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
    @State private var goalPickerPresented = false
    @State private var dayPickerPresented = false
    @State private var iconPresented = false
    @State private var changedColor: Color = Color.pink
    @State private var selectedColor: Color = .indigo
    @State private var selectedOption = 0
    @State private var showingAlert = false
    @State private var showingErrorAlert = false
    @State private var showingSuccessAlert = false
    @State private var stringColor = ""
    @EnvironmentObject var iconStore: IconStore
    @Environment (\.managedObjectContext) var managedObj
    
    //@Environment(\.presentationMode) var presentationMode
    var firstColorSet: [Color] = Constant.firstColorSet
    var secondColorSet: [Color] = Constant.secondColorSet
    var firstCategorySet: [String] = Constant.firstCategorySet
    var secondCategorySet: [String] = Constant.secondCategorySet
    var paddingValue: CGFloat = 22
    
    var body: some View {
        
        NavigationView {
            ViewThatFits {
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Alışkanlık").padding(EdgeInsets(top: 8, leading: paddingValue, bottom: 0, trailing: 0))
                            TextField("Başlık Gir", text: $habitTitle)
                                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                                .frame(height: 40)
                                .background(Color.gray.opacity(0.3).cornerRadius(10))
                                .font(.headline)
                                .padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: 22))
                            
                        }//Alışkanlık
                        VStack(alignment: .leading) {
                            Text("Açıklama").padding(EdgeInsets(top: 8, leading: paddingValue, bottom: 0, trailing: 16))
                            
                            TextField("Açıklama Ekle", text: $habitDescription)
                                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                                .frame(height: 40)
                                .background(Color.gray.opacity(0.3).cornerRadius(10))
                                .font(.headline)
                                .padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: 22))
                        }//Açıklama
                        HStack {
                            VStack(alignment: .leading) {
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
                            }//Hedef
                            VStack(alignment: .leading) {
                                Text("Hatırlatıcı").padding(EdgeInsets(top: 8, leading: paddingValue, bottom: 0, trailing: 0))
                                TextField("Seçim Yapın", text: $reminderText)
                                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                                    .frame(height: 40)
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
                            Text("Renk")
                        }.padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: 0))
                        HStack {
                            
                            ForEach(firstColorSet, id: \.self) { color in
                                Button {
                                    changedColor = color
                                    stringColor = "\(color)"
                                    withAnimation(Animation.easeInOut) {
                                        selectedColor = color
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
                                    stringColor = "\(color)"
                                    withAnimation(Animation.easeInOut) {
                                        selectedColor = color
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
                            Text("Özel Renk")
                            ColorPicker("", selection: $selectedColor)
                                                .frame(width: 20)
                                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                           
                            
                        }
                        // Özel Renk
                        VStack(alignment: .leading) {
                            
                            Text("Kategori").padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: 0))
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
                                        }
                                    })
                                    .sheet(isPresented: $iconPresented) {
                                        IconPickerView(selectedIcon: Constant.IconSet(rawValue: selectedTitle) ?? .other, selectedColor: selectedColor)
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
                                        
                                    }.sheet(isPresented: $iconPresented) {
                                        IconPickerView(selectedIcon: Constant.IconSet(rawValue: selectedTitle) ?? .other, selectedColor: selectedColor)
                                            .presentationDetents([.fraction(0.3)])
                                            .presentationDragIndicator(.visible)
                                    }
                                    Spacer()
                                }
                            }.padding(EdgeInsets(top: 0, leading: paddingValue, bottom: paddingValue, trailing: 0))
                            VStack {
                                
                                Button("Alışkanlık Ekle") {
                                    if habitTitle.isEmpty || habitDescription.isEmpty || goalText.isEmpty || reminderText.isEmpty || iconStore.selectedIconName.isEmpty {
                                        showingAlert = true
                                        print("color", stringColor)
                                    } else {
                                        print("Habititle", habitTitle)
                                        print("desc", habitDescription)
                                        print("goal", goalText)
                                        print("color", stringColor)
                                        print("Icon",iconStore.selectedIconName)
                                        CoreDataManager.shared.saveHabits(title: habitTitle, description: habitDescription, goalText: goalText, habitIcon: iconStore.selectedIconName, habitColor: stringColor, context: managedObj)
                                        //presentationMode.wrappedValue.dismiss()
                                    }
                                }.alert(isPresented: $showingAlert) {
                                    Alert(title: Text("Boş Alan bırakılamaz!"), message: Text("Lütfen gerekli alanları doldurun."), dismissButton: .default(Text("Tamam")))
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
            }.onReceive(Just(selectedColor)) { newColor in
                stringColor = "\(selectedColor.toHex() ?? "")"
                print(stringColor)
            }
            
            
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Image("logo")
            }
            
        }
        .offset()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(goalText: "", reminderText: "", selectedTitle: "Besin")
    }
}
