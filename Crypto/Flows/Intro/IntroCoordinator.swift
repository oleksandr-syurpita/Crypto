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
    
    init(viewModel: IntroViewModel) {
        self.viewModel = viewModel
        viewModel.onResult = { [weak self] result in
            switch result {
            case .navigationNext:
                self?.moveToMain()
            }
        }
    }
    
    private func moveToMain() {
        
        let coordinator = MainCoordinator(
            viewModel: MainViewModel(
                apiModel: ApiModel()
            )
        )
        self.route = .navigationMain(mainCoordinator: coordinator)
    }
}
