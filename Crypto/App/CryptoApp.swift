//
//  CryptoApp.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import SwiftUI

@main
struct CryptoApp: App {
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(
                coordinator: AppCoordinator(
                    preferences: UserDefaultsManager(),
                    introView: IntroViewModel(),
                    coordinatorMain: MainCoordinator(
                        viewModel: MainViewModel(
                            apiModel: ApiModel()
                        )
                    )
                )
            )
        }
    }
}
