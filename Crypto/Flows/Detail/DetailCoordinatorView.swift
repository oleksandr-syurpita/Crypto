//
//  DetailCoordinatorView.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 17.02.2023.
//

import SwiftUI
import SwiftUINavigation

struct DetailCoordinatorView: View {
    
    @ObservedObject var coordinator: DetailCoordinator

    var body: some View {
        NavigationView {
            ZStack {
                DetailView(viewModel: coordinator.viewModel)
            }
        }
    }
}

