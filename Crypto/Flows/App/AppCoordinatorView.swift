//
//  AppCoordinatorView.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 23.02.2023.
//

import SwiftUI
import SwiftUINavigation

struct AppCoordinatorView: View {
    
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        NavigationView {
            ZStack {
                switch coordinator.route {
                case .intro:
                    IntroCoordinatorView(coordinator: coordinator.coordinatorIntro)
                case .main:
                    MainCoordinatorView(coordinator: coordinator.coordinatorMain)
                case .none:
                    EmptyView()
                }
            }
        }
    }
}

