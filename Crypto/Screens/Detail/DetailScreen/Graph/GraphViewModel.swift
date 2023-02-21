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
    @Published var detailsPeriodPrices = [PeriodPrices]()

    let maxValue: Double = 100
    var coin: Coins
    let apiModel: ApiModel
    
    
    func checkPrices() {
        apiModel.detailsCheck(id: coin.id) { detail in
            for prices in detail.periodPrices {
                self.detailsPeriodPrices.append(prices)
                print(prices)
//                print(self.detailsPeriodPrices)
            }
        }
    }
    
    init(coinInfo: [PeriodPrices], coin: Coins, apiModel: ApiModel) {
        self.coin = coin
        self.apiModel = apiModel
        priceInfoViewModels = coinInfo.enumerated().map { (index, priceInfo) in
            return PriceInfoViewModel (
                price: priceInfo.price,
                day: priceInfo.date,
                color: coinInfo.getColor(index: index)
            )
        }
    }

}
