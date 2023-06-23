//
//  Item.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 23.06.23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
