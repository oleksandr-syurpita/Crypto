//
//  UserDefaultsManager.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 23.02.2023.
//

import Foundation

class UserDefaultsManager {
    
    private let showScreen = "show_Screen"
    var isOn: Bool {
        get {
            UserDefaults.standard.bool(forKey: showScreen)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: showScreen)
        }
    }
}
