//
//  File.swift
//  
//
//  Created by MikhailSeregin on 19.05.2022.
//

import Foundation
import Routing

public final class NotificationFactory {
    public static let notificationService = NotificationService()
    public static func create(router: RouterProtocol) -> BaseCoordinator {
        NotificationCoordinator(router: router, service: notificationService)
    }
}

final class NotificationCoordinator: BaseCoordinator {
    
    let service: NotificationService
    
    init(router: RouterProtocol, service: NotificationService) {
        self.service = service
        super.init(router: router)
    }
    
    override func start() {
        showNotificationSettingsView()
    }
    
    func showNotificationSettingsView() {
        let view = SettingsView(viewModel: .init(notificationService: service)).wrapIntoHostV2()
        router.presentStack(root: view, animated: true, style: .fullScreen)
    }
}
