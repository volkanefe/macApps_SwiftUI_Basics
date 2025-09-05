//
//  ContentView.swift
//  macApp7
//
//  Created by VOLKAN EFE on 16.07.2025.
//

import SwiftUI

struct ContentView: View {
    
    let items = [
        Item(title: "İlk Öğeyi Seç", detail: "Bu ilk öğenin detayları."),
        Item(title: "İkinci Öğeyi Seç", detail: "Bu ikinci öğenin detayları."),
        Item(title: "Üçüncü Öğeyi Seç", detail: "Bu üçüncü öğenin detayları.")
    ]
    
    var body: some View {
        NavigationView {
            List(items){ item in
                NavigationLink(destination: DetailView(item: item)){
                    Text(item.title)
                }
            }
            .frame(minWidth: 200)
            .navigationTitle("Öğeler")
            
            Text("Bir öğre seçin")
                .frame(maxWidth: .infinity,  maxHeight: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
