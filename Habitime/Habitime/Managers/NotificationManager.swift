//
//  NotificationManager.swift
//  Habitime
//
//  Created by Furkan Sarı on 2.10.2023.
//

import UserNotifications


final class NotificationManager {
    static let shared = NotificationManager()
    
    private init() { }
    
    func scheduleNotifications(_ notificationDays: [Int], hour: Int, minute: Int) {
        let center = UNUserNotificationCenter.current()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                for day in notificationDays {
                    let content = UNMutableNotificationContent()
                    content.title = "Habitime"
                    content.body = "Bugün önemli bir göreviniz var!"
                    
                    var dateComponents = DateComponents()
                    dateComponents.timeZone = TimeZone.current
                    dateComponents.calendar = Calendar.current
                    dateComponents.weekday = day
                    dateComponents.hour = hour
                    dateComponents.minute = minute
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                    
                    
                    let request = UNNotificationRequest(identifier: "reminder-\(day)", content: content, trigger: trigger)
                    
                    center.add(request) { error in
                        if let error = error {
                            print("Bildirim hatası: \(error.localizedDescription)")
                        } else {
                            print("Bildirim başarıyla ayarlandı.")
                        }
                    }
                }
            } else {
                print("Alert Error")
            }
            
        }
    }
}




