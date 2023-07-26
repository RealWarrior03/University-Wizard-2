//
//  Settings.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 27.06.23.
//

import SwiftUI
import Setting

struct Settings: View {
    @AppStorage("notifications") var notifications = false
    @AppStorage("hightlightdue") var hightlightdue = true
    @AppStorage("defaultdue") var defaultdue = 0
    @State var testvar = Date()
    
    var body: some View {
        SettingStack(isSearchable: false) {
            SettingPage(title: "Settings") {
                SettingGroup(header: "Resources") {
                    SettingPage(title: "Add Subject") {
                        SettingText(title: "coming soon")
                    }
                    .previewIcon("pencil")
                    
                    SettingPage(title: "Set Websites") {
                        SettingText(title: "coming soon")
                    }
                    .previewIcon("link")
                    
                    SettingPage(title: "Set Schedule Categories") {
                        SettingText(title: "coming soon")
                    }
                    .previewIcon("calendar")
                }
                
                SettingGroup(header: "University") {
                    SettingToggle(title: "Notifications", isOn: $notifications)
                    SettingCustomView {
                        DatePicker("Default Due", selection: $testvar, displayedComponents: [.hourAndMinute])
                            .padding()
                    }
                    SettingToggle(title: "Hightlight Due within 24 hours", isOn: $hightlightdue)
                }
                
                SettingGroup(header: "Other") {
                    SettingPage(title: "About") {
                        SettingText(title: "soon")
                    }
                    .previewIcon("i.circle")
                    
                    SettingPage(title: "Licenses") {
                        SettingText(title: "soon")
                    }
                    .previewIcon("c.circle")
                }
                
                SettingGroup(header: "Danger Zone") {
                    SettingText(title: "soon")
                }
            }
        }
    }
}

#Preview {
    Settings()
}
