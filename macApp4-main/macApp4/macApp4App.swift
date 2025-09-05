//
//  macApp4App.swift
//  macApp4
//
//  Created by VOLKAN EFE on 13.07.2025.
//

import SwiftUI

@main
struct macApp4App: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}
