//
//  macApp3App.swift
//  macApp3
//
//  Created by VOLKAN EFE on 10.07.2025.
//

import SwiftUI

@main
struct macApp3App: App {
    
    @StateObject private var taskStore = TaskStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
               
        }
        .windowResizability(.contentSize)
        
    }
}
