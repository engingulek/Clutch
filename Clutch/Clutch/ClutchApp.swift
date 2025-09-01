//
//  ClutchApp.swift
//  Clutch
//
//  Created by Engin Gülek on 29.08.2025.
//

import SwiftUI
import DependencyKit
import ClutchNavigationKit
import ClutchModularProtocols
import ClutchOnboardingModule

@main
struct ClutchApp: App {
    @StateObject private var navigation = Navigation()
    init() {
        let container = DependencyRegister.shared.container
        container.register(OnboardingModuleProtocol.self) { resolver in
            ClutchOnboardingModule()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigation.path) {
                navigation.build(page: .onboarding)
                    .navigationDestination(for: Page.self) { page in
                        navigation.build(page: page)
                    }
            }
            .environmentObject(navigation)
        }
    }
}
