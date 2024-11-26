import SwiftUI


struct ReminderListView: View {
    
    @StateObject
    private var viewModel = ReminderListViewModel()
    
    @State
    private var isAddReminderDialogPresented = false

    private func presentAddReminderView(){
        isAddReminderDialogPresented.toggle()
    }
    
  var body: some View {
      List($viewModel.reminders) { $reminder in
      HStack {
        Image(systemName: reminder.isCompleted
              ? "largecircle.fill.circle"
              : "circle")
          .imageScale(.large)
          .foregroundColor(.accentColor)
          .onTapGesture {
              viewModel.toggleCompleted(reminder)
          }
        Text(reminder.title)
      }
    }.toolbar {
        ToolbarItemGroup(placement: .bottomBar){
            Button(action: presentAddReminderView){
                HStack{
                    Image(systemName: "plus.circle.fill")
                    Text("New Reminder")
                }
            }
            Spacer()
        }
    }.sheet(isPresented: $isAddReminderDialogPresented){
        AddReminderView { reminder in
            viewModel.addReminder(reminder)
        }
    }
  }
}


struct ReminderListView_Previews: PreviewProvider {
  static var previews: some View {
      NavigationStack{
          ReminderListView().navigationTitle("Reminders")
      }
  }
}
