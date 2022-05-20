//
//  File.swift
//  
//
//  Created by MikhailSeregin on 19.05.2022.
//

import Foundation

struct Notification: Codable {
    let title: String
    let subtitle: String
    
    var type: NotificationType; enum NotificationType: String, Codable {
        case gratitude, plan
    }
}
