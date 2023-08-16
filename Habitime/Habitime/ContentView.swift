//
//  ContentView.swift
//  Habitime
//
//  Created by Furkan Sarı on 9.08.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .center) {
                Image("man")
                
                Button(action: mainScreen) {
                    NavigationLink(destination: AddTaskView(goalText: "", reminderText: "")) {
                        Image("plus2").frame(width: 40, height: 40).border(.gray, width: 2).foregroundColor(.pink).background(Color.gray.opacity(0.7)).cornerRadius(10)
                    }
                    
                }
                Text("Alışkanlık bulunamadı + düğmesine dokun")
                Text("Yeni Alışkanlık ekle").font(.callout)
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("logo")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button(action: mainScreen) {
                    Image(systemName: "gearshape").foregroundColor(.pink)
                } ,
                
                trailing: Button(action: mainScreen) {
                    Image(systemName: "gauge.high").foregroundColor(.pink).bold()
                })
        }
        }
        
    }
    
    func mainScreen() {
       
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

