//
//  ContentView.swift
//  Habitime
//
//  Created by Furkan Sarı on 9.08.2023.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) var managedObject
    @FetchRequest(sortDescriptors:[]) var goals: FetchedResults<Habits>
    @State var completed = [Int]()
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                if goals.count > 0 {
                    List(goals) { goal in
                        Section {
                            TrackerView(habitTitle: goal.habitTitle ?? "", habitDesc: goal.habitDescription ?? "", habitHexColor: goal.habitColor ?? "#FFF", habitIcon: goal.habitIcon ?? "x", startDate: goal.habitDate ?? Date(), habit: goal, completedDays: goal.completedDays ?? [20] ).padding(EdgeInsets(top: -25, leading: -15, bottom: -45, trailing: -20)).onTapGesture {
                                
                            }
                        }
                        
                    }
                    .frame(width: 415)
                    .listStyle(.insetGrouped)
                    
                } else {
                    Image("man")
                    NavigationLink(destination: AddTaskView(goalText: "", reminderText: "")) {
                        Image("plus2").frame(width: 40, height: 40).border(.gray, width: 2).foregroundColor(.pink).background(Color.gray.opacity(0.7)).cornerRadius(10)
                    }
                    Text("Alışkanlık bulunamadı + düğmesine dokun")
                    Text("Yeni Alışkanlık ekle").font(.callout)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("logo")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button {
                    
                } label: {
                    NavigationLink(destination:SettingSideView()) {
                        Image(systemName: "gear").foregroundColor(.pink).bold()
                    }
                } ,
                
                trailing: Button {
                 
                } label: {
                   NavigationLink(destination:AddTaskView(goalText: "", reminderText: "")) {
                    Image(systemName: "plus").foregroundColor(.pink).bold()
                    }
                    
                })
            
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

