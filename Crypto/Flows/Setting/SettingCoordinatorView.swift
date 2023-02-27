//
//  SettingCoordinatorView.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 17.02.2023.
//

import SwiftUI
import SwiftUINavigation

struct SettingCoordinatorView: View {
    
    @ObservedObject var coordinator: SettingCoordinator
    
    var body: some View {
        NavigationView {
            ZStack{
                SettingsView(viewModel: coordinator.viewModel)
            }
        }
    }
}
