//
//  cursorDurum.swift
//  macApp2
//
//  Created by VOLKAN EFE on 10.07.2025.
//

import Foundation
import SwiftUI

struct HandCursorModifier: ViewModifier {
    @Binding var isHovering: Bool

    func body(content: Content) -> some View {
        content.onHover { hovering in
            isHovering = hovering
            if hovering {
                NSCursor.pointingHand.push()
            } else {
                NSCursor.pop()
            }
        }
    }
}

extension View {
    func handCursor(isHovering: Binding<Bool>) -> some View {
        self.modifier(HandCursorModifier(isHovering: isHovering))
    }
}
