//
//  MainCoordinatorView.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 17.02.2023.
//

import SwiftUI
import SwiftUINavigation

struct MainCoordinatorView: View {
    
    @ObservedObject var coordinator: MainCoordinator
    
    var body: some View {
        NavigationView {
            ZStack {
                MainView(viewModel: coordinator.viewModel)
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /MainCoordinator.Route.navigationToSettings,
                    destination: {(coordinator: Binding<SettingCoordinator>) in
                    SettingCoordinatorView(coordinator: coordinator.wrappedValue).navigationBarBackButtonHidden(true)
                }, onNavigate: { _ in}) {}
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /MainCoordinator.Route.navigationToDetail,
                    destination: {(coordinator: Binding<DetailCoordinator>) in
                        DetailCoordinatorView(coordinator: coordinator.wrappedValue).navigationBarBackButtonHidden(true)
                }, onNavigate: { _ in}) {}
            }
        }
    }
}

