//
//  ContentView.swift
//  macApp8
//
//  Created by VOLKAN EFE on 16.07.2025.
//

import SwiftUI

struct ContentView: View {
    
    let items = [
        Item(title: "Kitap", detail: "Bu bir kitap detayıdır."),
        Item(title: "Kalem", detail: "Bu bir kalem açıklamasıdır."),
        Item(title: "Defter", detail: "Bu bir defter hakkında bilgi.")
    ]
    
    var body: some View {
        NavigationStack {
            List(items){ item in
                NavigationLink(value: item){
                    Text(item.title)
                }
            }
            .navigationTitle("Ürünler")
            .navigationDestination(for: Item.self){ item in
                DetailView(item: item)
            }
        }
        .frame(minWidth: 400, minHeight: 300)
    }
}

#Preview {
    ContentView()
}
