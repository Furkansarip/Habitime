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
    @State var emptyHabitText = """
                             You're here to make your life more organized, productive, and balanced. Our habits shape who we are and who we will become. This app is your guide to achieving big goals with small steps every day.
                             
                             This app helps you set your goals, track your progress, and build habits that last. Success is the result of small, consistent actions, and we're here to support you on your journey.
                             """
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack {
            VStack {
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
                } else {
                    VStack {
                        Image("man")
                            .background(colorScheme == .dark ? Color.white : nil)
                        Text(emptyHabitText).padding()
                        .font(.title3)
                        NavigationLink(destination: AddTaskView(goalText: "", reminderText: "")) {
                            Text("Add a Habit")
                        }.buttonStyle(.bordered)
                            .foregroundStyle(.pink)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("logo")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button {} label: {
                  NavigationLink(destination:AddTaskView(goalText: "", reminderText: "")) {
                    Image(systemName: "plus").foregroundColor(.pink).bold()
                    }
                })
            
        }.onAppear {
            oldHabitsRemove()
        }
    }
    
    func oldHabitsRemove() {
        let thisYear = Calendar.current.component(.year, from: Date())
        let habitYears = habits.filter { $0.habitDate?.year() ?? 0 < thisYear }
        guard !habitYears.isEmpty else { return }
        for item in habitYears {
            managedObject.delete(item)
        }
        emptyHabitText = "New year, new goals, a new journey—are you ready? Revisit your old habits and create new ones!\nRemember, discipline is a stronger energy than motivation."
        try? managedObject.save()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

