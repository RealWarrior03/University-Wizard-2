//
//  TabViewer.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 23.06.23.
//

import SwiftUI

struct TabViewer: View {
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                switch viewRouter.currentPage {
                case .home:
                    Home()
                case .assignments:
                    AssignmentList()
                case .settings:
                    Settings()
                }
            }
            .overlay {
                VStack {
                    Spacer()
                    ZStack {
                        CustomTabView(viewRouter: viewRouter)
                            .frame(width: geo.size.width*0.9, height: geo.size.height*0.1)
                            .padding(.bottom, 10)
                    }
                }//.frame(width: geo.size.width*0.9)
            }
        }
    }
}

#Preview {
    TabViewer(viewRouter: ViewRouter())
}
