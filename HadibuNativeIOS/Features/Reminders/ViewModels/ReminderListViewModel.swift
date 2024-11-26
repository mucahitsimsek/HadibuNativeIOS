//
//  ReminderListViewModel.swift
//  HadibuNativeIOS
//
//  Created by Mücahit Şimşek on 26.11.2024.
//

import Foundation

final class ReminderListViewModel: ObservableObject {
    @Published
    var reminders = Reminder.samples
    
    func addReminder(_ reminder: Reminder){
        reminders.append(reminder)
    }
    
    func toggleCompleted(_ reminder: Reminder){
        if let index = reminders.firstIndex(where: {$0.id == reminder.id}) {
            reminders[index].isCompleted.toggle()
        }
    }
}
