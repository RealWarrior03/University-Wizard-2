//
//  AssignmentList.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 27.06.23.
//

import SwiftUI
import SwiftData

struct AssignmentList: View {
    @Query(sort: \.due, order: .forward) var assignments: [Assignment]
    @Query private var items: [Item]
    @Environment(\.modelContext) private var modelContext
    
    @State var sheetPage: AssignmentSheets? = nil
    @State var showSheet: Bool = false
    @State var sheetType: String = "homework"
    @State var selectedAssignment: Assignment? = nil
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        formatter.doesRelativeDateFormatting = true
        return formatter
    }()
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(assignments[index])
            }
        }
    }
    
    var body: some View {
        NavigationStack() {
            List {
                ForEach(assignments) { assignment in
                    Menu {
                        Button {
                            
                        } label: {
                            Label("Done", systemImage: "checkmark")
                        }
                        
                        Button {
                            self.sheetPage = .edit
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        
                        /*Button {
                            //self.selectedAssignment = assignment
                            //self.sheetPage = .detail
                            self.showSheet.toggle()
                        } label: {
                            Label("Details", systemImage: "doc.plaintext")
                        }*/
                        NavigationLink {
                            AssignmentDetailView(assignment: assignment)
                        } label: {
                            Label("Details", systemImage: "doc.plaintext")
                        }

                        
                        Button {
                            
                        } label: {
                            Label("Delete", systemImage: "trash")
                                .foregroundColor(.red)
                        }
                    } label: {
                        AssignmentView(assignment: assignment)
                            .foregroundColor(.primary)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Assignments")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.sheetPage = .add
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Section(header: Text("Add")) {
                            Button {
                                self.sheetType = "homework"
                                self.sheetPage = .add
                            } label: {
                                Text("New Homework")
                            }
                            Button {
                                self.sheetType = "exam"
                                self.sheetPage = .add
                            } label: {
                                Text("New Exam")
                            }
                        }
                        Menu {
                            Text("By Date (Ascending)")
                            Text("By Date (Descending)")
                            Text("Alphabetically")
                        } label: {
                            Label("Sorting Options", systemImage: "list.bullet.indent")
                        }
                        Menu {
                            Text("Homework only")
                            Text("Exams only")
                        } label: {
                            Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                }
            }
            .sheet(item: $sheetPage) { type in
                switch type {
                    case .add:
                        NewAssignment(type: self.sheetType)
                    case .detail:
                        AssignmentDetailView(assignment: self.selectedAssignment)
                    case .edit:
                        Text("soon")
                }
            }
            /*.sheet(isPresented: $showSheet) {
                NewAssignment(type: self.sheetType)
            }*/
        }
    }
}

enum AssignmentSheets: Identifiable {
    case add
    case detail
    case edit
    
    var id: AssignmentSheets {
        self
    }
}

#Preview {
    AssignmentList()
}
