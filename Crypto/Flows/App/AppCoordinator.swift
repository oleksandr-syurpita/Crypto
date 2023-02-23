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
    var coordinatorIntro: IntroCoordinator
    var coordinatorMain: MainCoordinator
    
    init(
        preferences: UserDefaultsManager,
        coordinatorIntro:IntroCoordinator,
        coordinatorMain: MainCoordinator
    ) {
        self.coordinatorIntro = coordinatorIntro
        self.coordinatorMain = coordinatorMain
        if preferences.isOn {
            route = .main
        } else {
            route = .intro
        }
    }
}
