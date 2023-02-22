//
//  MainCoordinator.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 17.02.2023.
//

import Foundation

class MainCoordinator: ObservableObject {
    
    enum Route {
        case navigationToDetail(detailCoordinator: DetailCoordinator)
        case navigationToSettings(settingsCoordinator: SettingCoordinator)
    }
    
    @Published var route: Route?
    
    var viewModel: MainViewModel
    var coins: Coins
    
    init(viewModel: MainViewModel, coins: Coins) {
        self.viewModel = viewModel
        self.coins = coins
        viewModel.onResult = { [weak self] result in
            switch result {
            case .navigationToDetail(let detail):
                self?.moveToDetails(detail: detail)
            case .navigationSettings:
                self?.moveToSettings()
            }
        }
    }
    
    private func moveToDetails(detail: Coins) {
        let coordinator = DetailCoordinator(viewModel: DetailViewModel(coin: detail, apiModel: ApiModel()))
        coordinator.onResult = { [weak self] result in
            switch result {
            case .navigationBack:
                self?.route = nil
            }
        }
        self.route = .navigationToDetail(detailCoordinator: coordinator)
    }
    
    private func moveToSettings() {
        let coordinator = SettingCoordinator(viewModel: SettingsViewModel())
        coordinator.onResult = { [ weak self ] result in
            switch result {
            case .navigationBack:
                self?.route = nil
            }
        }
        self.route = .navigationToSettings(settingsCoordinator: coordinator)
    }
}
