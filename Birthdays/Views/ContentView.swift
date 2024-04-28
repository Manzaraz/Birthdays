//
//  ContentView.swift
//  Birthdays
//
//  Created by Christian Manzaraz on 27/04/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack {
                    Text("New Birthday")
                        .font(.headline)
                    
                    DatePicker(
                        selection: $newDate,
                        in: Date.distantPast...Date.now,
                        displayedComponents: .date
                    ) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newDate)
                        context.insert(newFriend)
                        
                        newName = ""
                        newDate = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
            .task {
                context.insert(Friend(name: "Roxana Sadlon", birthday: .now))
                context.insert(Friend(name: "Erika Ruiz", birthday: Date(timeIntervalSince1970: 0)))
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
