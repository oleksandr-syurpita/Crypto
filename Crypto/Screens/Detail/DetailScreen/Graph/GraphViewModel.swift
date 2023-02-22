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
    let apiModel: ApiModel
    var coin: Coins
        
    init(coin: Coins, apiModel: ApiModel) {
        self.coin = coin
        self.apiModel = apiModel
    }
    
    func checkPrices() {
        apiModel.detailsCheck(id: coin.id) { detail in
            self.priceInfoViewModels = detail.periodPrices.enumerated().map { (index, priceInfo) in
                return PriceInfoViewModel (
                    price: priceInfo.price,
                    day: priceInfo.date.convertGraph(time: priceInfo.date),
                    color: detail.periodPrices.getColor(index: index)
                )
            }
        }
    }
}
