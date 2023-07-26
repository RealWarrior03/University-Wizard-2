//
//  Home.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 23.06.23.
//

import SwiftUI
import SwiftData

struct Home: View {
    @Query(sort: \.due, order: .forward) var assignments: [Assignment]
    let exams = #Predicate<Assignment> {
        $0.type == "exam"
    }
    let homework = #Predicate<Assignment> {
        $0.type == "homework"
    }
    var examCount: Int {
        //assignments.filter(exams).count
        try! assignments.filter(self.exams).count
    }
    var homeworkCount: Int {
        try! assignments.filter(self.homework).count
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(getGreeting())
                        .font(.largeTitle)
                        .bold()
                    Text(getDate())
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    
                    HStack {
                        GroupBox {
                            Text(String(self.homeworkCount))
                                .font(.largeTitle)
                                .padding(10)
                        } label: {
                            Label("Homework", systemImage: "book.pages")
                        }
                        
                        GroupBox {
                            Text(String(self.examCount))
                                .font(.largeTitle)
                                .padding(10)
                        } label: {
                            Label("Exams", systemImage: "pencil.and.ruler")
                        }
                    }
                    
                    GroupBox {
                        HStack {
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("Link 1")
                                    .lineLimit(1)
                            }
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("Link 2")
                                    .lineLimit(1)
                            }
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("Link 3")
                                    .lineLimit(1)
                            }
                            Spacer()
                        }.buttonStyle(.borderedProminent)
                    } label: {
                        Label("Links", systemImage: "link")
                    }
                    
                    NavigationLink {
                        // TODO: implement schedule
                        Text("schedule coming soon")
                    } label: {
                        GroupBox {
                            Text("soon")
                        } label: {
                            Label("Schedule", systemImage: "calendar")
                        }
                        .foregroundColor(.primary)
                    }
                    
                    GroupBox {
                        Text("soon")
                    } label: {
                        Label("Next Homework", systemImage: "book.pages")
                    }
                    
                    GroupBox {
                        Text("soon")
                    } label: {
                        Label("Next Exam", systemImage: "pencil.and.ruler")
                    }
                }.padding()
            }
        }
    }
}

#Preview {
    Home()
        .modelContainer(for: Assignment.self, inMemory: true)
}
