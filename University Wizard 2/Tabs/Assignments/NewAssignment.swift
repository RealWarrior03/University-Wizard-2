//
//  NewAssignment.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 28.06.23.
//

import SwiftUI

struct NewAssignment: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) private var presentationMode
    
    @State var id: UUID = UUID()
    @State var type: String = "homework"
    @State var title: String = ""
    @State var comment: String = ""
    @State var done: Bool = false
    @State var subject: String = ""
    @State var notify: Bool = false
    @State var notifyDate: Date = Date()
    @State var due: Date = Date()
    @State var state: String = "todo"
    
    var body: some View {
        NavigationStack() {
            List {
                Section(header: Text("General")) {
                    TextField("Title", text: $title)
                    
                    Picker(selection: $subject) {
                        Text("soon")
                    } label: {
                        Text("Subject")
                    }
                    
                    DatePicker(selection: $due) {
                        Text("Due Date")
                    }
                    
                    Picker(selection: $type) {
                        Text("Homework").tag("homework")
                        Text("Exam").tag("exam")
                    } label: {
                        Text("Type")
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Comment")) {
                    TextEditor(text: $comment)
                }
                
                Section(header: Text("Notification")) {
                    Toggle(isOn: $notify) {
                        Text("Set up a notification?")
                    }
                    
                    if self.notify {
                        DatePicker(selection: $notifyDate) {
                            Text("")
                        }
                    }
                }
            }
            .navigationTitle("New Assignment")
            .overlay {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Button {
                            let newAssignment = Assignment(id: self.id, type: self.type, title: self.title, comment: self.comment, done: self.done, subject: self.subject, notify: self.notify, notifyDate: self.notifyDate, due: self.due, state: self.state)
                            modelContext.insert(newAssignment)
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Add Assignment")
                        }
                        .buttonStyle(.borderedProminent)
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    NewAssignment()
}
