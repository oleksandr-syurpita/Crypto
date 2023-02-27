//
//  Struct.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 22.02.2023.
//

import Foundation

struct TestApi: Codable, Identifiable {
    
    let id: String
    let prop1: Int
    let prop2: Bool
}

struct CheckCoin: Codable {
    
    let data: [Coins]
}

struct Coins: Codable, Identifiable {
    
    let id: String
    let name: String
    let price: Double
    let imageURL: String
}

struct CoinDetails: Codable {
    
    let currentPrice: Double
    let periodPrices: [PeriodPrices]
    let news: [News]
}

struct News: Codable, Identifiable {
    
    let id: String
    let date: String
    let title: String
    let url: String
    
}

struct PeriodPrices: Codable {
    
    let id: String
    let date: String
    let price: Double
}
