//
//  LoginFormMacOSApp.swift
//  LoginFormMacOS
//
//  Created by VOLKAN EFE on 26.03.2024.
//

import SwiftUI

@main
struct LoginFormMacOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // HIDING THE TITLE BAR...
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

extension NSTextField{
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}
