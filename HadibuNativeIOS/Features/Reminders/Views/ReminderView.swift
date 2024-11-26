//
//  ReminderView.swift
//  HadibuNativeIOS
//
//  Created by Mücahit Şimşek on 25.11.2024.
//

import SwiftUI

struct AddReminderView: View {
    enum  FocusableField: Hashable{
        case title
    }
    
    @FocusState
    private var focuesField: FocusableField?
    
    @State
     private var reminder = Reminder(title: "")
    
    @Environment(\.dismiss)
    private var dismiss
    
    var onCommit: (_ reminder: Reminder) -> Void
    
    private func commit() {
        onCommit(reminder)
        dismiss()
    }
    
    private func cancel(){
        dismiss()
    }
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Hello aslanım", text: $reminder.title)
                    .focused($focuesField, equals: .title)
            }.navigationTitle("New Reminder")
                .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                  Button(action: cancel) {
                    Text("Cancel")
                  }
                }

                ToolbarItem(placement: .confirmationAction) {
                  Button(action: commit) {
                    Text("Add")
                  }
                }
            }.onAppear{
                focuesField = .title
            }
        }
    }
}

#Preview {
    AddReminderView{
        reminder in
        print("You added a new reminder titled \(reminder.title)")
    }
}
