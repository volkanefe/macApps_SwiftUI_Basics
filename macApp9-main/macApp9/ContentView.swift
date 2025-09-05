//
//  ContentView.swift
//  macApp9
//
//  Created by VOLKAN EFE on 16.07.2025.
//

import SwiftUI

struct ContentView: View {
    
    let sampleData: [FileItem] = [
        FileItem(name: "Belgeler", isFolder: true, children: [
            FileItem(name: "Belge 1.pdf", isFolder: false),
            FileItem(name: "Belge 2.pdf", isFolder: false),
        ]),
        FileItem(name: "Müzik", isFolder: true, children: [
            FileItem(name: "Rock", isFolder: true, children: [
                FileItem(name: "Queen - Bohemain.mp3", isFolder: false)
            ]),
            FileItem(name: "Resimler", isFolder: true, children: [])
        ])
        
    ]
    
    var body: some View {
        NavigationView {
            List {
                OutlineGroup(sampleData, children: \.children){ item in
                    Label(item.name, systemImage: item.isFolder ? "folder" : "doc")
                }
            }
            .frame(minWidth: 300, maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
