//
//  IntroCoordinatorView.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 17.02.2023.
//

import SwiftUI
import SwiftUINavigation

struct IntroCoordinatorView: View {
    
    @ObservedObject var coordinator: IntroCoordinator

    var body: some View {
        NavigationView {
            ZStack {
                IntroView(viewModel: coordinator.viewModel)
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /IntroCoordinator.Route.navigationMain,
                    destination: {(coordinator: Binding<MainCoordinator>) in
                    MainCoordinatorView(coordinator: coordinator.wrappedValue)
                    .navigationBarBackButtonHidden(true)
                }, onNavigate: { _ in}) {}
            }
        }
    }
}
