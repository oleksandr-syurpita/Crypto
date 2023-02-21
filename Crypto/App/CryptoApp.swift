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
//            IntroView(viewModel: .init())
//            MainView(viewModel: .init())
//            SettingsView(viewModel: .init())
//            DetailErrorView()
//            DetailView(viewModel: .init(coinName: Coins(id: "Bitcoin", name: "Bitcoin", count: 312312.312, imageURL: "")))
//            DetailLoadingView(viewModel: .init(coinName: Coins(id: "1", name: "ok", count: 123.312, imageURL: "")))
            IntroCoordinatorView(coordinator: IntroCoordinator(viewModel: IntroViewModel(apiModel: ApiModel()), coins: Coins(id: "", name: "", price: 312.123, imageURL: "")))
        }
    }
}
