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
            IntroCoordinatorView(
                coordinator: IntroCoordinator(
                    viewModel: IntroViewModel()
                )
            )
//            AppCoordinatorView(coordinator: AppCoordinator(preferences: UserDefaultsManager(), coordinatorIntro: IntroCoordinator(viewModel: IntroViewModel()), coordinatorMain: MainCoordinator(viewModel: MainViewModel(apiModel: ApiModel()))))
        }
    }
}
