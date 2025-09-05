//
//  SettingsView.swift
//  macApp11
//
//  Created by VOLKAN EFE on 26.07.2025.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Text("Ayarlar")
                .font(.largeTitle)
            Toggle("Karanlık Mod", isOn: .constant(true))
                .padding()
            Button("Kapat") {
                dismiss()
            }
            .padding(.top)
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
