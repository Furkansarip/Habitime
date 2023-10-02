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
    @FetchRequest(sortDescriptors:[]) var habits: FetchedResults<Habits>
    @State var completed = [Int]()
    @State var detailStatus: Bool = false
    @State var detail: FetchedResults<Habits>.Element?
   
    var body: some View {
        NavigationStack {
            VStack() {
                if habits.count > 0 {
                    
                    ZStack {
                        List(habits) { habit in
                            Section {
                                TrackerView(habitTitle: habit.habitTitle ?? "", habitDesc: habit.habitDescription ?? "", habitHexColor: habit.habitColor ?? "#FFF", habitIcon: habit.habitIcon ?? "x", startDate: habit.habitDate ?? Date(), habit: habit, completedDays: habit.completedDays ?? [20], habitDates: habit.formattedDates ?? []).padding(EdgeInsets(top: -15, leading: 0, bottom: -25, trailing: 0)).onTapGesture {
                                    detailStatus = true
                                    detail = habit
                                }
                               
                            }
                        }
                        
                        .frame(width: 415)
                        .listStyle(.insetGrouped)
                        
                    }
                }
                
                else {
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
                    /* removeAllObject() */
                    
                } label: {
                  NavigationLink(destination:AddTaskView(goalText: "", reminderText: "")) {
                    Image(systemName: "plus").foregroundColor(.pink).bold()
                    }
                   // Image(systemName: "plus").foregroundColor(.pink).bold()
                })
            
        }
    }
    
    func removeAllObject() {
        for item in habits {
            managedObject.delete(item)
        }
        try? managedObject.save()
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

