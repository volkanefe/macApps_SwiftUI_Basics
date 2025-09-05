//
//  ContentView.swift
//  macApp6
//
//  Created by VOLKAN EFE on 16.07.2025.
//

import SwiftUI

struct ColorItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let color: Color
}

let sampleColors: [ColorItem] = [
    ColorItem(name: "Kırmızı", color: .red),
    ColorItem(name: "Yeşil", color: .green),
    ColorItem(name: "Mavi", color: .blue),
    ColorItem(name: "Sarı", color: .yellow),
    ColorItem(name: "Turuncu", color: .orange)
]

struct ContentView: View {
    @State private var selectedColor: ColorItem? = sampleColors.first
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedColor) {
                ForEach(sampleColors) { item in
                    Text(item.name)
                        .tag(item)
                }
            }
            .navigationTitle("Renkler")
        } detail: {
            if let selected = selectedColor {
                VStack {
                    Text("Seçilen renk : \(selected.name)")
                        .font(.title)
                        .padding()
                    
                    Rectangle()
                        .fill(selected.color)
                        .frame(width: 200, height: 200)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Text("Lütfen bir renk seçiniz.")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(width: 600, height:400)
    }
}

#Preview {
    ContentView()
}
