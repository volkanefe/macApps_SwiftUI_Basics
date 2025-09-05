//
//  DetailView.swift
//  macApp8
//
//  Created by VOLKAN EFE on 16.07.2025.
//

import SwiftUI

struct DetailView: View {
    
    let item: Item
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(item.title)
                .font(.title)
            Text(item.detail)
                .font(.body)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DetailView(item: .init(title: "Title", detail: "Detail"))
}
