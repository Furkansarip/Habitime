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
    
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy" // İstediğiniz tarih formatını burada belirtin
        return dateFormatter.string(from: self)
    }
    
    func year() -> Int {
        let calendar = Calendar.current
        return calendar.component(.year, from: self)
    }
}
