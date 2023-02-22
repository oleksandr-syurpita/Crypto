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

    func toDate(withFormat format: String = "MM/dd/yyyy")-> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
    
    func toDateCoin(withFormat format: String = "MM/dd/yyyy HH:mm")-> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
    
    func convertCoin(time: String) -> String {
        
        let toDate = time.description.toDateCoin()
        
        guard let toString = toDate?.toStringCoin() else { return "Error" }
        
        return toString
    }
    
    func convertGraph(time: String) -> String {
        
        let toDate = time.description.toDate()
        
        guard let toString = toDate?.toString() else { return "Error" }
        
        return toString
    }
}
