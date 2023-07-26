//
//  ViewRouter.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 23.06.23.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case homework
    case exams
    case keycards
    case timer
    case settings
}
