import XCTest
@testable import Notification

final class the_emotion_notificationTests: XCTestCase {
    func testLoadNotifications() throws {
        let service = NotificationService()
        XCTAssert(!service.getNotifications().isEmpty, "Не должен быть пустым")
    }
    
    func testChangeNotificationSettings() throws {
        NotificationSettings.isEnabled = false
        XCTAssertFalse(NotificationSettings.isEnabled)
        
        NotificationSettings.isEnabled = true
        XCTAssertTrue(NotificationSettings.isEnabled)
    }
}
