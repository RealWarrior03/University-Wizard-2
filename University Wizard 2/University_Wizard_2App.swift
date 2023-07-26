//
//  University_Wizard_2App.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 23.06.23.
//

import SwiftUI
import SwiftData

@main
struct University_Wizard_2App: App {
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
        }
        .modelContainer(
            for: [Item.self, Assignment.self]
        )
    }
}
