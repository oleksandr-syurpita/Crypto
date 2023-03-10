//
//  SettingsViewModel.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    @Published var isOn = false
    
    enum Result {
        case navigationBackMain
    }
    
    var onResult: ((Result) -> Void)?
    
    func moveToBack() {
        onResult?(.navigationBackMain)
    }
}
