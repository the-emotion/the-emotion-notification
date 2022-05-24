//
//  File.swift
//  
//
//  Created by MikhailSeregin on 19.05.2022.
//

import Foundation
import Routing
import Services

public final class NotificationFactory {
    public static let notificationService = NotificationService()
    public static func create(router: RouterProtocol, analyticService: AnalyticServiceProtocol) -> BaseCoordinator {
        NotificationCoordinator(router: router, service: notificationService, analyticService: analyticService)
    }
}

final class NotificationCoordinator: BaseCoordinator {
    
    let service: NotificationService
    let analyticService: AnalyticServiceProtocol
    
    init(router: RouterProtocol, service: NotificationService, analyticService: AnalyticServiceProtocol) {
        self.service = service
        self.analyticService = analyticService
        super.init(router: router)
    }
    
    override func start() {
        showNotificationSettingsView()
    }
    
    func showNotificationSettingsView() {
        let view = SettingsView(viewModel: .init(notificationService: service, analyticService: analyticService)).wrapIntoHostV2()
        router.presentStack(root: view, animated: true, style: .fullScreen)
    }
}
