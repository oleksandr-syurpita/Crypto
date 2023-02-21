//
//  IncroCoordinator.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 17.02.2023.
//

import Foundation

class IntroCoordinator: ObservableObject {
    
    enum Route {
        case navigationMain(mainCoordinator: MainCoordinator)
    }
    
    @Published var route: Route?
    
    var viewModel: IntroViewModel
    var coins: Coins
    
    init(viewModel: IntroViewModel, coins: Coins) {
        self.coins = coins
        self.viewModel = viewModel
        viewModel.onResult = { [weak self] result in
            switch result {
            case .navigationNext(let coins):
                self?.moveToMain(coins: coins)
            }
        }
    }
    
    private func moveToMain(coins: Coins) {
        
        let coordinator = MainCoordinator(viewModel: MainViewModel(apiModel: ApiModel()), coins: coins)
        self.route = .navigationMain(mainCoordinator: coordinator)
    }
}
