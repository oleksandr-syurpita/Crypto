//
//  AppCoordinator.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 23.02.2023.
//

import Foundation

class AppCoordinator: ObservableObject {
    
    enum Route {
        case main
        case intro
    }
    
    @Published var route: Route?
    
    var introView: IntroViewModel
    var coordinatorMain: MainCoordinator
    
    init(
        preferences: UserDefaultsManager,
        introView: IntroViewModel,
        coordinatorMain: MainCoordinator
    ) {
        self.introView = introView
        self.coordinatorMain = coordinatorMain
        introView.onResult = {[weak self] result in
            switch result {
                
            case .navigationNext:
                self?.route = .main
            }
        }
        
        if preferences.isOn {
            route = .main
        } else {
            route = .intro
        }
    }
}
