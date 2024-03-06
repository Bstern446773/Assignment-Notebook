//
//  AddAssignmentview.swift
//  Assignment Notebook
//
//  Created by Bennett Stern on 2/20/24.
//

import SwiftUI

struct AddAssignmentview: View {
    @ObservedObject var assignmentList : AssignmentList
    @State private var showingaddAssignmentView = false
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let courses = ["Math", "Science", "English", "PE", "History"]
    var body: some View {
        ZStack {
            Color.red.opacity(0.7).edgesIgnoringSafeArea(.all)
            NavigationView {
                Form {
                    Picker("course", selection: $description) {
                        ForEach(Self.courses, id: \.self) { course in
                            Text(course)
                        }
                    }
                    TextField("Description", text: $description)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                }
                .navigationBarTitle("Add New Assignment Item", displayedMode: .inline)
                .navigationBarItems(trailing: Button("Save") {
                    if course.count > 0 && description.count > 0 {
let item = AssignmentItem(id: UUID(), course: course, description: description, dueDate: dueDate)
                        assignmentList.items.append(item)
                        presentationMode.wrappedValue.dismiss()
                    }
                })
            }
            NavigationViewStyle(StackNavigationViewStyle())
        }
    }
}
struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentview(assignmentList: AssignmentList())
    }
}
