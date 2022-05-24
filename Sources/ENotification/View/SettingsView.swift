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
                    Toggle(isOn: $viewModel.isNotificationsEnabled) {
                        Text("Notifications enabled".localized())
                    }
                }
                Section(header: Text("Allowed notifications".localized())) {
                    if viewModel.unNotificationSettings?.authorizationStatus == UNAuthorizationStatus.authorized {
                        
                        Toggle(isOn: $viewModel.gratitudeNotificationsEnabled) {
                            Text("gratitude".localized())
                        }
                        
                        Toggle(isOn: $viewModel.planningNotificationsEnabled) {
                            Text("plan".localized())
                        }
                        
                    } else {
                        Text("Notifications are disabled, for enable notifications go to Settings")
                        Button("Open settings") {
                            viewModel.openAppSettings()
                        }
                    }
                }
            }
        }
        .navigationTitle(Text("Notification settings".localized()))
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
