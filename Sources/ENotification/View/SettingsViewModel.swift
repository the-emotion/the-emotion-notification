//
//  File.swift
//  
//
//  Created by MikhailSeregin on 19.05.2022.
//

import Foundation
import UserNotifications
import Combine
import UIKit

final class SettingsViewModel: ObservableObject {
    @Published var unNotificationSettings: UNNotificationSettings?
    @Published var isNotificationsEnabled: Bool
    @Published var gratitudeNotificationsEnabled: Bool
    @Published var planningNotificationsEnabled: Bool
    
    let notificationService: NotificationService
    
    private var disposables = Set<AnyCancellable>()
    
    init(notificationService: NotificationService) {
        self.notificationService = notificationService
        self.isNotificationsEnabled = NotificationSettings.isEnabled
        gratitudeNotificationsEnabled = NotificationSettings.gratitudeNotificationsEnabled
        planningNotificationsEnabled = NotificationSettings.planningNotificationsEnabled
        bind()
        getUNNotificationSettings()
    }
    
    func getUNNotificationSettings() {
        notificationService.getNotificationSettings { settings in
            self.unNotificationSettings = settings
        }
    }
    
    func bind() {
        $isNotificationsEnabled.sink { success in
            if NotificationSettings.isEnabled != success {
                NotificationSettings.isEnabled = success
            }
        }
        .store(in: &disposables)
        
        $gratitudeNotificationsEnabled.sink { success in
            if NotificationSettings.gratitudeNotificationsEnabled != success {
                NotificationSettings.gratitudeNotificationsEnabled = success
                self.notificationService.setStaticNotifications { _ in }
            }
        }
        .store(in: &disposables)
        
        $planningNotificationsEnabled.sink { success in
            if NotificationSettings.planningNotificationsEnabled != success {
                NotificationSettings.planningNotificationsEnabled = success
                self.notificationService.setStaticNotifications { _ in }
            }
        }
        .store(in: &disposables)
    }
    
    func openAppSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, completionHandler: nil)
        }
    }
    
}
