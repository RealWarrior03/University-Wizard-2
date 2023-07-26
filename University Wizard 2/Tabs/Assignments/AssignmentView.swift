//
//  AssignmentView.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 26.07.23.
//

import SwiftUI

struct AssignmentView: View {
    var assignment: Assignment
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        formatter.doesRelativeDateFormatting = true
        return formatter
    }()

    var body: some View {
        HStack {
            if assignment.type == "homework" {
                Image(systemName: "h.square")
                    .padding(.trailing)
            } else if assignment.type == "exam" {
                Image(systemName: "e.square")
                    .padding(.trailing)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(assignment.title)
                        .bold()
                    Spacer()
                    Text(assignment.subject)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Text("\(assignment.due, formatter: dateFormatter)")
            }
        }
    }
}
