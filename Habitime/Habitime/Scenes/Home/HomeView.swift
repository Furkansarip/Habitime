//
//  ContentView.swift
//  Habitime
//
//  Created by Furkan Sarı on 9.08.2023.
//

import SwiftUI
import CoreData

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Image("man")
                    NavigationLink(destination: AddTaskView(goalText: "", reminderText: "")) {
                        Image("plus2").frame(width: 40, height: 40).border(.gray, width: 2).foregroundColor(.pink).background(Color.gray.opacity(0.7)).cornerRadius(10)
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
                leading: Button(action: settingView) {
                    Image(systemName: "gearshape").foregroundColor(.pink)
                } ,
                
                trailing: Button(action: settingView) {
                    Image(systemName: "gauge.high").foregroundColor(.pink).bold()
                })
        }
        }
        
    }
    
    func settingView() {
       
    }
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }

