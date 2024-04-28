//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Christian Manzaraz on 27/04/2024.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
