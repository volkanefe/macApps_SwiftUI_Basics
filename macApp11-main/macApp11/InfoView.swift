//
//  InfoView.swift
//  macApp11
//
//  Created by VOLKAN EFE on 26.07.2025.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack{
            Text("Hakkında")
                .font(.largeTitle)
            Text("Bu, macOS için SwiftUI tabanlı sekmeli bir örnektir.")
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
    }
}

#Preview {
    InfoView()
}
