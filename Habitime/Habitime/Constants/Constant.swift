//
//  Constant.swift
//  Habitime
//
//  Created by Furkan Sarı on 19.08.2023.
//

import SwiftUI

struct Constant {
    static let firstColorSet = [Color.red, Color.blue, Color.yellow, Color.pink, Color.indigo, Color.green, Color.gray, Color.orange, Color.brown]
    static let secondColorSet = [Color.purple, Color.secondary, Color.cyan, Color.purple.opacity(0.5), Color.mint, Color.teal, Color.gray.opacity(0.4), Color.pink.opacity(0.7), Color.green.opacity(0.5)]
    static let firstCategorySet = ["Activity", "Sport", "Food"]
    static let secondCategorySet = ["Art", "Money", "Other"]
    static let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    static let daysDictionary = ["Mon" : 2, "Tue" : 3, "Wed" : 4, "Thu" : 5, "Fri" : 6, "Sat" : 7, "Sun" : 1]
    enum IconSet: String {
        case sport = "Sport"
        case food = "Food"
        case activity = "Activity"
        case art = "Art"
        case money = "Money"
        case other = "Other"
    }
}
/*
 Pazartesi: Mon
 Salı: Tue
 Çarşamba: Wed
 Perşembe: Thu
 Cuma: Fri
 Cumartesi: Sat
 Pazar: Sun
 */

class HabitData: ObservableObject {
    @Published var habitSavedArray: [String] = []
}
