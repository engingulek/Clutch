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
import ClutchAccountModule

@main
struct ClutchApp: App {
    @StateObject private var navigation = Navigation()
    init() {
        let container = DependencyRegister.shared.container
        container.register(OnboardingModuleProtocol.self) { resolver in
            ClutchOnboardingModule()
        }
        
        container.register(AccountModuleProtocol.self) { resolver in
            ClutchAccountModule()
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
