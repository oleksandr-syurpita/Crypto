//
//  SettingCoordinator.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 17.02.2023.
//

import Foundation

class SettingCoordinator: ObservableObject {
    
    enum Result {
        case navigationBackMain
    }
    
    var onResult: ((Result) -> Void)?
    var viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        viewModel.onResult = { [ weak self ] result in
            switch result {
            case .navigationBackMain:
                self?.onResult?(.navigationBackMain)
            }
        }
    }
}
