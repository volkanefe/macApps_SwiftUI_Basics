//
//  macApp5App.swift
//  macApp5
//
//  Created by VOLKAN EFE on 15.07.2025.
//

import SwiftUI

@main
struct macApp5App: App {
    
    @StateObject private var appModel = AppModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(selectedColor: $appModel.selectedColor)
                .frame(width: 300, height: 200)
                
        }
        .windowResizability(.contentSize)
        .commands {
            CommandMenu("Renk Menüsü"){
                ForEach(renkListesi) {renk in
                    Button {
                        appModel.selectedColor = renk.name
                    } label: {
                        Label(renk.name, systemImage: "circle.fill")
                            .foregroundStyle(renk.color)
                    }
                }
            }
        }
    }
        
}

struct ColorOption: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}

let renkListesi: [ColorOption] = [
    ColorOption(name: "Kırmızı", color: .red),
    ColorOption(name: "Yeşil", color: .green),
    ColorOption(name: "Mavi", color: .blue)
]


