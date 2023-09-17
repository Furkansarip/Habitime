//
//  Constant.swift
//  Habitime
//
//  Created by Furkan Sarı on 19.08.2023.
//

import SwiftUI

struct Constant {
    static let firstColorSet = [Color.red, Color.blue, Color.yellow, Color.pink, Color.indigo, Color.green, Color.gray, Color.orange, Color.brown]
    static let secondColorSet = [Color.purple, Color.secondary, Color.cyan, Color.black, Color.mint, Color.teal, Color.gray.opacity(0.4), Color.pink.opacity(0.7), Color.green.opacity(0.5)]
    static let firstCategorySet = ["Aktivite", "Spor", "Besin"]
    static let secondCategorySet = ["Sanat", "Para", "Çeşitli"]
    static let days = ["Pzt", "Sal", "Çarş", "Perş", "Cum", "Cmt", "Paz"]
    
    enum IconSet: String {
        case sport = "Spor"
        case food = "Besin"
        case activity = "Aktivite"
        case art = "Sanat"
        case money = "Para"
        case other = "Çeşitli"
    }
}

class HabitData: ObservableObject {
    @Published var habitSavedArray: [String] = []
}
