//
//  File.swift
//  
//
//  Created by MikhailSeregin on 19.05.2022.
//

import Foundation
import UserNotifications

public final class NotificationService: NSObject {
    private var notifications: [Notification]
    private let decoder: JSONDecoder
    
    override public init() {
        self.decoder = JSONDecoder()
        self.notifications = []
        
        super.init()
        loadData()
        setStaticNotifications() {_ in}
    }
    // MARK: - Аавторизация на получение токенов и получение статуса нотификаций
    public func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Notifications are granted")
            }
        }
    }
    
    func getNotificationSettings(completion: @escaping (UNNotificationSettings) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            completion(settings)
        }
    }
    
    // MARK: - Установка стандартных нотификаций
    func setStaticNotifications(completion: @escaping (AddNotificationStatus) -> Void) {
        // Удаляем весь список не доставленных нотификаций
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        // Для тестов
        var counter = notifications.count
        var success = 0
        var fail = 0
        
        for notification in notifications {
            let request = notification.notificationRequest
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print(error.localizedDescription)
                    fail += 1
                } else {
                    success += 1
                    print(request.description)
                }
                counter -= 1
                if counter == 0 {
                    if success == self.notifications.count {
                        completion(.success)
                    } else if fail == self.notifications.count {
                        completion(.failed)
                    } else {
                        completion(.partSuccess)
                    }
                }
            }
        }
    }
    
    
    // MARK: - Private
    private func loadData() {
        guard let path = Bundle.module.path(forResource: "Notifications", ofType: "json") else { return }
        do {
            let string = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            guard let data = string.data(using: .utf8) else { return }
            self.notifications = try decoder.decode([Notification].self, from: data)
        } catch {
            
        }
    }
    
    // MARK: Для тестов
    func getNotifications() -> [Notification] {
        notifications
    }
}

enum AddNotificationStatus {
    case success, failed, partSuccess
}
