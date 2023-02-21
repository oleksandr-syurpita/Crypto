//
//  GraphViewModel.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 17.02.2023.
//

import Foundation
import SwiftUI

class GraphViewModel: ObservableObject {

    @Published var fullBarHeight: Double = 250
    @Published var priceInfoViewModels: [PriceInfoViewModel] = []
    
    let maxValue: Double = 100
        
    init(coinInfo: [PriceInfo]) {
        priceInfoViewModels = coinInfo.enumerated().map { (index, priceInfo) in
            return PriceInfoViewModel (
                price: priceInfo.price,
                day: priceInfo.day,
                color: coinInfo.getColor(index: index)
            )
        }
    }
    
}
struct PriceInfo {
    let price: Double
    let day: String
}
