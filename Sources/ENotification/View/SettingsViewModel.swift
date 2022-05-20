//
//  File.swift
//  
//
//  Created by MikhailSeregin on 19.05.2022.
//

import Foundation
import UserNotifications
import Combine

final class SettingsViewModel: ObservableObject {
    @Published var unNotificationSettings: UNNotificationSettings?
    @Published var isNotificationsEnabled: Bool
    
    let notificationService: NotificationService
    
    private var disposables = Set<AnyCancellable>()
    
    init(notificationService: NotificationService) {
        self.notificationService = notificationService
        self.isNotificationsEnabled = NotificationSettings.isEnabled
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
    }
    
}
