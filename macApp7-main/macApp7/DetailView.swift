//
//  DetailView.swift
//  macApp7
//
//  Created by VOLKAN EFE on 16.07.2025.
//

import SwiftUI

struct DetailView: View {
    
    let item: Item
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(item.title)
                .font(.title)
            Text(item.detail)
                .font(.body)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    DetailView(item: Item(title: "Başlık", detail: "Detay"))
}
