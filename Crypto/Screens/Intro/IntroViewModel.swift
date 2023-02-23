//
//  MainViewModel.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import Foundation

class IntroViewModel: ObservableObject {
    
    enum Result {
        case navigationNext
    }
    
    @Published var animation = false
    @Published var animationButton = false
    @Published var errorHandler = false
    @Published var isOns = true
    
    var onResult:((Result) -> Void)?
    var checkApi = TestApi(
        id: String(),
        prop1: 1,
        prop2: false
    )
    
    func navigation() {
        onResult?(.navigationNext)
        UserDefaultsManager().isOn = isOns
    }
}
