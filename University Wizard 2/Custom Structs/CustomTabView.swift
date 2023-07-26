//
//  CustomTabView.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 23.06.23.
//

import SwiftUI

struct CustomTabView: View {
    @StateObject var viewRouter: ViewRouter
    
    @State var widthDivider: CGFloat = 5 // bei allen items: 6
    @State var heightDivider: CGFloat = 28
    
    @State var colorHome: Color = .accentColor.opacity(1.0)
    @State var colorAssignments: Color = .accentColor.opacity(0.3)
    @State var colorSettings: Color = .accentColor.opacity(0.3)
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                    .fill(.thickMaterial)
                HStack {
                    CustomTabItem(icon: "house", text: "Home", color: self.colorHome, width: geo.size.width/widthDivider, height: geo.size.height/heightDivider, viewRouter: viewRouter, assignedPage: .home, colorHome: $colorHome, colorHW: $colorAssignments, colorSettings: $colorSettings)
                    CustomTabItem(icon: "checkmark.square", text: "Assignments", color: self.colorAssignments, width: geo.size.width/widthDivider, height: geo.size.height/heightDivider, viewRouter: viewRouter, assignedPage: .assignments, colorHome: $colorHome, colorHW: $colorAssignments, colorSettings: $colorSettings)
                    CustomTabItem(icon: "gear", text: "Settings", color: self.colorSettings, width: geo.size.width/widthDivider, height: geo.size.height/heightDivider, viewRouter: viewRouter, assignedPage: .settings, colorHome: $colorHome, colorHW: $colorAssignments, colorSettings: $colorSettings)
                }
            }
        }
    }
}

#Preview {
    CustomTabView(viewRouter: ViewRouter())
}
