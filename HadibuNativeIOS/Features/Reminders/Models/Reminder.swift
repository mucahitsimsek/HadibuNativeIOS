import Foundation


struct Reminder: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted = false
        
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}


