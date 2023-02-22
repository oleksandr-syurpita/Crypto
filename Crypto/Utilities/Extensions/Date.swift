//
//  Date.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 22.02.2023.
//

import Foundation

extension Date {

    func toString(withFormat format: String = "MM.dd") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
    
    func toStringCoin(withFormat format: String = "HH") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}
