//
//  AddTaskView.swift
//  Habitime
//
//  Created by Furkan Sarı on 9.08.2023.
//

import SwiftUI
import UIKit

struct AddTaskView: View {
    @State var habitTitle: String = ""
    @State var goalText: String
    @State var reminderText: String
    @State private var goalPickerPresented = false
    @State private var dayPickerPresented = false
    @State private var changedColor: Color = Color.pink
    @State private var selectedColor: Color? = nil
    @State private var selectedOption = 0
    
    var firstColorSet: [Color] = Constant.firstColorSet
    var secondColorSet: [Color] = Constant.secondColorSet
    var firstCategorySet: [String] = Constant.firstCategorySet
    var secondCategorySet: [String] = Constant.secondCategorySet
    var paddingValue: CGFloat = 22
    
    var body: some View {
        
    NavigationView {
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
                        
                        TextField("Açıklama Ekle", text: $habitTitle)
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
                                    CustomPickerView(isSheetPresented: $goalPickerPresented, goalText: $goalText).presentationDetents([.fraction(0.35)])
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
                                    DayPicker(reminderText: $reminderText, isPresentedDay: $dayPickerPresented).presentationDetents([.fraction(0.35)])
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
                        Button("Özel Renk") {
                            print("hello")
                        }.frame(width: 110)
                            .background(changedColor)
                            .cornerRadius(10)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                            .foregroundColor(.white)
                            .font(.headline)
                        
                    } // Özel Renk
                    VStack(alignment: .leading) {
                        
                        Text("Kategori").padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: 0))
                    }
                    VStack {
                        HStack {
                            ForEach(firstCategorySet, id: \.self) { title in
                                Button {
                                    debugPrint("hello")
                                } label: {
                                    CategoryButton(buttonTitle: title, buttonColor: Color.gray.opacity(0.6))
                                }
                                Spacer()
                            }
                        }.padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: 0))
                        
                        HStack {
                            ForEach(secondCategorySet, id: \.self) { title in
                                Button {
                                    debugPrint("hello")
                                } label: {
                                    CategoryButton(buttonTitle: title, buttonColor: Color.gray.opacity(0.6))
                                }
                                Spacer()
                            }
                        }.padding(EdgeInsets(top: 0, leading: paddingValue, bottom: paddingValue, trailing: 0))
                        VStack {
                            
                            Button("Alışkanlık Ekle") {
                                print("h")
                            }
                            .frame(width: 350, height: 50)
                            .background(changedColor)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding(EdgeInsets(top: 0, leading: paddingValue, bottom: 0, trailing: paddingValue))
                            Spacer()
                        }
                        
                    } // Kategoriler
                    
                }
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
        AddTaskView(goalText: "", reminderText: "")
    }
}
