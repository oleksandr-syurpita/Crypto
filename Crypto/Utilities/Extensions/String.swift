//
//  String.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 17.02.2023.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    func localizedWithVars(vars: CVarArg...) -> String {
        return String(
            format: localized,
            arguments: vars
        )
    }
}
