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
                    viewModel: IntroViewModel(
                        apiModel: ApiModel()),
                        coins: Coins(
                            id: "",
                            name: "",
                            price: 312.123,
                            imageURL: "")
                )
            )
        }
    }
}
