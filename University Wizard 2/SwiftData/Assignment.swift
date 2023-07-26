//
//  Assignment.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 28.06.23.
//

import Foundation
import SwiftData

@Model
final class Assignment {
    @Attribute(.unique) var id: UUID
    var type: String
    var title: String
    var comment: String
    var done: Bool
    var subject: String
    var notify: Bool
    var notifyDate: Date
    var due: Date
    var state: String
    
    init(id: UUID, type: String, title: String, comment: String, done: Bool, subject: String, notify: Bool, notifyDate: Date, due: Date, state: String) {
        self.id = id
        self.type = type
        self.title = title
        self.comment = comment
        self.done = done
        self.subject = subject
        self.notify = notify
        self.notifyDate = notifyDate
        self.due = due
        self.state = state
    }
}
