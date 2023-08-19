//
//  Date+Ext.swift
//  Habitime
//
//  Created by Furkan Sarı on 19.08.2023.
//

import Foundation


extension Date {
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
}
