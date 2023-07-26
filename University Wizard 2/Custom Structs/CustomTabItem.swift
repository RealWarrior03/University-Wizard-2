//
//  CustomTabItem.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 23.06.23.
//

import SwiftUI

struct CustomTabItem: View {
    let icon, text: String
    let color: Color
    let width, height: CGFloat
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    @Binding var colorHome: Color
    @Binding var colorHW: Color
    @Binding var colorSettings: Color
    
    var body: some View {
        ZStack {
            Circle().opacity(0.00001)
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(color)
                    .frame(width: 25, height: 25)
                    .padding(.top, 10)
                Text(text)
                    .font(.footnote)
                    .padding(.bottom, 0)
                    .foregroundColor(color)
                Spacer()
            }.padding(.horizontal, -4).frame(width: width, height: height)
        }
        .padding(.horizontal, 10)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
            if viewRouter.currentPage == .home {
                colorHome = .accentColor.opacity(1.0)
                colorHW = .accentColor.opacity(0.3)
                colorSettings = .accentColor.opacity(0.3)
            } else if viewRouter.currentPage == .assignments {
                colorHome = .accentColor.opacity(0.3)
                colorHW = .accentColor.opacity(1.0)
                colorSettings = .accentColor.opacity(0.3)
            } else if viewRouter.currentPage == .settings {
                colorHome = .accentColor.opacity(0.3)
                colorHW = .accentColor.opacity(0.3)
                colorSettings = .accentColor.opacity(1.0)
            }
        }
    }
}
