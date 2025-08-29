//
//  ClutchApp.swift
//  Clutch
//
//  Created by Engin Gülek on 29.08.2025.
//

import SwiftUI
import DependencyKit

@main
struct ClutchApp: App {
    init() {
        let container = DependencyRegister.shared.container
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
