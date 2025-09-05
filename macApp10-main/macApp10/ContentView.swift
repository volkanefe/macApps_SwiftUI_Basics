//
//  ContentView.swift
//  macApp10
//
//  Created by VOLKAN EFE on 17.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedColor: Color = .blue
    
    var body: some View {
        VStack(spacing: 20){
            ColorPicker("Renk Seç", selection: $selectedColor)
                .padding()
                .frame(width: 200)
            
            Rectangle()
                .fill(selectedColor)
                .frame(width: 200, height: 150)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
            
            if let components = selectedColor.cgColor?.components {
                Text(String(format: "R: %.0f G: %.0f B: %.0f", components[0] * 255, components[1] * 255, components[2] * 255))
                    .font(.headline)
                    .foregroundColor(.primary)
            }
        }
        .padding()
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
