//
//  AddTaskView.swift
//  Habitime
//
//  Created by Furkan Sarı on 9.08.2023.
//

import SwiftUI

struct AddTaskView: View {
    @State var habitTitle: String = ""
    var firstColorSet: [Color] = [Color.red, Color.blue, Color.yellow, Color.pink, Color.indigo, Color.green, Color.gray, Color.orange, Color.brown]
    var secondColorSet: [Color] = [Color.purple, Color.secondary, Color.cyan, Color.black, Color.mint, Color.teal, Color.gray.opacity(0.4), Color.pink.opacity(0.7), Color.green.opacity(0.5)]
    var firstCategorySet: [String] = ["Aktivite", "Spor", "Besin"]
    var secondCategorySet: [String] = ["Sanat", "Para", "Çeşitli"]
    var leadPadding: CGFloat = 22
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Alışkanlık").padding(EdgeInsets(top: 8, leading: leadPadding, bottom: 0, trailing: 0))
                    TextField("Başlık Gir", text: $habitTitle)
                        .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                        .frame(height: 40)
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .font(.headline)
                        .padding(EdgeInsets(top: 0, leading: leadPadding, bottom: 0, trailing: 22))
                }//Alışkanlık
                VStack(alignment: .leading) {
                    Text("Açıklama").padding(EdgeInsets(top: 8, leading: leadPadding, bottom: 0, trailing: 16))
                    
                    TextField("Açıklama Ekle", text: $habitTitle)
                        .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                        .frame(height: 40)
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .font(.headline)
                        .padding(EdgeInsets(top: 0, leading: leadPadding, bottom: 0, trailing: 22))
                }//Açıklama
                HStack {
                    VStack(alignment: .leading) {
                        Text("Hedef").padding(EdgeInsets(top: 8, leading: leadPadding, bottom: 0, trailing: 0))
                        TextField("Hedef", text: $habitTitle)
                            .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                            .frame(height: 40)
                            .background(Color.gray.opacity(0.2).cornerRadius(10))
                            .font(.headline)
                            .padding(EdgeInsets(top: 0, leading: leadPadding, bottom: 0, trailing: leadPadding))
                    }//Hedef
                    VStack(alignment: .leading) {
                        Text("Hatırlatma").padding(EdgeInsets(top: 8, leading: leadPadding, bottom: 0, trailing: 0))
                        TextField("Hatırlatıcı", text: $habitTitle)
                            .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                            .frame(height: 40)
                            .background(Color.gray.opacity(0.2).cornerRadius(10))
                            .font(.headline)
                            .padding(EdgeInsets(top: 0, leading: leadPadding, bottom: 0, trailing: leadPadding))
                    }
                }// Hedef - Hatırlatma
                VStack {
                    Text("Renk")
                }.padding(EdgeInsets(top: 0, leading: leadPadding, bottom: 0, trailing: 0))
                HStack {
                    
                    ForEach(firstColorSet, id: \.self) { color in
                        Button {
                            debugPrint("hello")
                        } label: {
                            ColorButton(singleColor: color)
                        }
                    }
                }.padding(EdgeInsets(top: 0, leading: leadPadding, bottom: 0, trailing: 0))//First color
                HStack {
                    ForEach(secondColorSet, id: \.self) { color in
                        Button {
                            debugPrint("hello")
                        } label: {
                            ColorButton(singleColor: color)
                        }
                    }
                }.padding(EdgeInsets(top: 0, leading: leadPadding, bottom: 0, trailing: 0))//SEcond
                HStack {
                    Spacer()
                    Button("Özel Renk") {
                        print("hello")
                    }.frame(width: 110)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                        .foregroundColor(.white)
                        .font(.headline)
                    
                } // Özel Renk
                VStack(alignment: .leading) {
                    
                    Text("Kategori").padding(EdgeInsets(top: 0, leading: leadPadding, bottom: 0, trailing: 0))
                }
                VStack {
                    HStack {
                        ForEach(firstCategorySet, id: \.self) { title in
                            Button {
                                debugPrint("hello")
                            } label: {
                                CategoryButton(buttonTitle: title)
                            }
                            Spacer()
                        }
                    }.padding(EdgeInsets(top: 0, leading: leadPadding, bottom: 0, trailing: 0))
                    
                    HStack {
                        ForEach(secondCategorySet, id: \.self) { title in
                            Button {
                                debugPrint("hello")
                            } label: {
                                CategoryButton(buttonTitle: title)
                            }
                            Spacer()
                        }
                    }.padding(EdgeInsets(top: 0, leading: leadPadding, bottom: 0, trailing: 0))
                    VStack {
                            Spacer()
                            Button("Alışkanlık Ekle") {
                                print("h")
                            }
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding(EdgeInsets(top: 0, leading: leadPadding, bottom: 0, trailing: 0))
                            Spacer()
                        }
                    
                } // Kategoriler
               
            }
            
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Image("logo")
            }
        }
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
