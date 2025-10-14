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
import ClutchSelectFavTeamModule
import ClutchManagerKits


@main
struct ClutchApp: App {
    @StateObject private var navigation = Navigation()
    private var pageManager : PageManagerProtocol = PageManager()
    private var firstPage : Page = .onboarding
    init() {
        let container = DependencyRegister.shared.container
        container.register(OnboardingModuleProtocol.self) { resolver in
            ClutchOnboardingModule()
        }
        
        container.register(AccountModuleProtocol.self) { resolver in
            ClutchAccountModule()
        }
        
        container.register(SelectFavoriteTeamModuleProtocol.self) { resolver in
            ClutchSelectFavTeamModule()
        }
        
        
        switch pageManager.currentState {
        case .onboarding:
            print("Page onboarding")
            firstPage = .onboarding
        case .accountPage:
            print("Page account")
            firstPage = .account
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigation.path) {
                navigation.build(page: firstPage)
                    .navigationDestination(for: Page.self) { page in
                        navigation.build(page: page)
                    }
            }
            .environmentObject(navigation)
        }
    }
}
