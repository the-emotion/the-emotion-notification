//
//  File.swift
//  
//
//  Created by MikhailSeregin on 19.05.2022.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        Text("Notification Settings")
                            .font(.title2)
                        Spacer()
                    }
                    
                    Toggle(isOn: $viewModel.isNotificationsEnabled) {
                        Text("Notifications enabled")
                    }
                }
                Section {
                    SettingRowView(
                        setting: "Authorization Status",
                        enabled: viewModel.unNotificationSettings?.authorizationStatus == UNAuthorizationStatus.authorized)
                    SettingRowView(
                        setting: "Show in Notification Center",
                        enabled: viewModel.unNotificationSettings?.notificationCenterSetting == .enabled)
                    SettingRowView(
                        setting: "Sound Enabled?",
                        enabled: viewModel.unNotificationSettings?.soundSetting == .enabled)
                    SettingRowView(
                        setting: "Badges Enabled?",
                        enabled: viewModel.unNotificationSettings?.badgeSetting == .enabled)
                    SettingRowView(
                        setting: "Alerts Enabled?",
                        enabled: viewModel.unNotificationSettings?.alertSetting == .enabled)
                    SettingRowView(
                        setting: "Show on lock screen?",
                        enabled: viewModel.unNotificationSettings?.lockScreenSetting == .enabled)
                    SettingRowView(
                        setting: "Alert banners?",
                        enabled: viewModel.unNotificationSettings?.alertStyle == .banner)
                    SettingRowView(
                        setting: "Critical Alerts?",
                        enabled: viewModel.unNotificationSettings?.criticalAlertSetting == .enabled)
                    SettingRowView(
                        setting: "Siri Announcement?",
                        enabled: viewModel.unNotificationSettings?.announcementSetting == .enabled)
                }
            }
        }
    }
}

struct NotificationSettingsView_Previews: PreviewProvider {
  static var previews: some View {
      SettingsView(viewModel: .init(notificationService: .init()))
  }
}

struct SettingRowView: View {
    var setting: String
    var enabled: Bool
    var body: some View {
        HStack {
            Text(setting)
            Spacer()
            if enabled {
                Image(systemName: "checkmark")
                    .foregroundColor(.green)
            } else {
                Image(systemName: "xmark")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}
