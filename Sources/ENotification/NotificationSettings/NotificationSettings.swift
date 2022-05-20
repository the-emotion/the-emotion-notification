//
//  File.swift
//  
//
//  Created by MikhailSeregin on 19.05.2022.
//

import Foundation

public class NotificationSettings {
    private static var enableNotificationSettingsKey = "enableNotificationSettings"
    public static var isEnabled: Bool {
        get {
            UserDefaults.standard.bool(forKey: enableNotificationSettingsKey)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: enableNotificationSettingsKey)
        }
    }
}
