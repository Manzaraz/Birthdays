//
//  ContentView.swift
//  Birthdays
//
//  Created by Christian Manzaraz on 27/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(name: "Marlen del Valle", birthday: .now),
        Friend(name: "Roxana Sadlon", birthday: Date(timeIntervalSince1970: 0))
    ]
    
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
                        friends.append(newFriend)
                        
                        newName = ""
                        newDate = .now
                    }
                    .bold()
                }
            }
        }
        .padding()
        .background(.bar)
    }
}

#Preview {
    ContentView()
}
