//
//  AssignmentDetailView.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 26.07.23.
//

import SwiftUI

struct AssignmentDetailView: View {
    var assignment: Assignment?
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        formatter.doesRelativeDateFormatting = true
        return formatter
    }()
    
    var body: some View {
        if self.assignment == nil {
            Text("an error occured.. please try again")
        } else {
            List {
                Text(assignment!.type)
                Text(assignment!.title)
                Text("\(assignment!.due, formatter: dateFormatter)")
            }
            .navigationTitle(assignment!.title)
        }
    }
}
