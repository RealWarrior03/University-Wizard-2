//
//  ContentView.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 23.06.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    //@Query private var items: [Item]
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        TabViewer(viewRouter: viewRouter)
    }

    /*private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }*/

    /*private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }*/
}

#Preview("ContentView") {
    ContentView(viewRouter: ViewRouter())
        .modelContainer(for: Item.self, inMemory: true)
}
