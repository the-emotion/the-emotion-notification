//
//  File.swift
//  
//
//  Created by MikhailSeregin on 19.05.2022.
//

import Foundation

public class NotificationSettings {
    private static var enableNotificationSettingsKey = "enableNotificationSettings"
    private static var launchCounterKey = "luanchCounter"
    
    private static var gratitudeNotificationsEnabledKey = "gratitudeNotificationsEnabled"
    private static var planningNotificationsEnabledKey = "planningNotificationsEnabled"
    
    public static var isEnabled: Bool {
        get {
            if launchCounter > 0 {
                return UserDefaults.standard.bool(forKey: enableNotificationSettingsKey)
            } else {
                launchCounter = 1
                UserDefaults.standard.set(true, forKey: enableNotificationSettingsKey)
                return UserDefaults.standard.bool(forKey: enableNotificationSettingsKey)
            }
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: enableNotificationSettingsKey)
        }
    }
    
    internal static var gratitudeNotificationsEnabled: Bool {
        get {
            if launchCounter > 0 {
                return UserDefaults.standard.bool(forKey: gratitudeNotificationsEnabledKey)
            } else {
                launchCounter = 1
                UserDefaults.standard.set(true, forKey: gratitudeNotificationsEnabledKey)
                return UserDefaults.standard.bool(forKey: gratitudeNotificationsEnabledKey)
            }
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: gratitudeNotificationsEnabledKey)
        }
    }
    
    internal static var planningNotificationsEnabled: Bool {
        get {
            if launchCounter > 0 {
                return UserDefaults.standard.bool(forKey: planningNotificationsEnabledKey)
            } else {
                launchCounter = 1
                UserDefaults.standard.set(true, forKey: planningNotificationsEnabledKey)
                return UserDefaults.standard.bool(forKey: planningNotificationsEnabledKey)
            }
        }
        set {
            UserDefaults.standard.set(newValue, forKey: planningNotificationsEnabledKey)
        }
    }
    
    private static var launchCounter: Int {
        get {
            UserDefaults.standard.integer(forKey: launchCounterKey)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: launchCounterKey)
        }
    }
}
