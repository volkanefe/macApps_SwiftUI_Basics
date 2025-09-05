//
//  ContentView.swift
//  macApp5
//
//  Created by VOLKAN EFE on 15.07.2025.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var selectedColor: String
    
    var backgroundColor: Color {
        renkListesi.first(where: { $0.name == selectedColor })?.color ?? Color(NSColor.windowBackgroundColor)
    }
    
    var body: some View {
        VStack(spacing: 20){
            Text("Seçilen Renk:")
                .font(.headline)
            
            Text(selectedColor)
                .foregroundColor(.white)
                .bold()
            
            Menu("Renk Seç"){
                ForEach(renkListesi){renk in
                    Button {
                        selectedColor = renk.name
                    } label: {
                        Label(renk.name, systemImage: "circle.fill")
                            .foregroundStyle(renk.color)
                    }
                }
            }
            .menuStyle(.borderlessButton)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
        .animation(.easeInOut, value:selectedColor)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var previewColor = "Kırmızı"
    
    static var previews: some View {
        ContentView(selectedColor: $previewColor)
            .frame(width: 300, height: 200)
    }
}


