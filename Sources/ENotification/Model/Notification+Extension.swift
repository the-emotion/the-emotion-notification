//
//  File.swift
//  
//
//  Created by MikhailSeregin on 19.05.2022.
//

import Foundation
import NotificationCenter

extension Notification {
    var trigger: UNNotificationTrigger {
        return UNCalendarNotificationTrigger(
            dateMatching: type.getDateComponents(),
            repeats: false
        )
    }
    
    var content: UNMutableNotificationContent {
        let tag = type.rawValue
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = subtitle
        content.sound = .default
        content.userInfo = ["url": "emotion://the-emotion.ru/standard?tags=\(tag)"]
        return content
    }
    
    var notificationRequest: UNNotificationRequest {
        return .init(identifier: UUID().uuidString, content: content, trigger: trigger)
    }
}
extension Notification.NotificationType {
    
}
extension Notification.NotificationType {
    var notificationTime: Int {
        switch self {
        case .plan:
            return 9
        case .gratitude:
            return 19
        }
    }
    func getDateComponents() -> DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.year, .month, .day, .hour, .minute, .second, .timeZone],
            from: Date()
        )
        
        if (dateComponents.hour ?? 0) >= notificationTime {
            dateComponents.day! += 1
            dateComponents.hour = notificationTime
            dateComponents.minute = 0
        } else {
            dateComponents.hour = notificationTime
            dateComponents.minute = 0
        }
        
        return dateComponents
    }
}
