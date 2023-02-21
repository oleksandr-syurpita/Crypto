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
    @Published var priceInfoViewModels: [PriceInfoViewModel] = [] {
        didSet {
            print(priceInfoViewModels.count)
        }
    }
//    @Published var detailsPeriodPrices = [PeriodPrices]()

    let maxValue: Double = 100
    var coin: Coins
    let apiModel: ApiModel
    

    func checkPrices() {
        apiModel.detailsCheck(id: coin.id) { detail in
//            for price in detail.periodPrices {
//                self.detailsPeriodPrices.append(price)
////                print(prices)
//                print(self.detailsPeriodPrices)
//            }
            self.priceInfoViewModels = detail.periodPrices.enumerated().map { (index, priceInfo) in
                return PriceInfoViewModel (
                    price: priceInfo.price,
                    day: priceInfo.date,
                    color: detail.periodPrices.getColor(index: index)
                )
            }
        }
    }
    
    init(coin: Coins, apiModel: ApiModel) {
        self.coin = coin
        self.apiModel = apiModel
//        priceInfoViewModels = coinInfo.enumerated().map { (index, priceInfo) in
//            return PriceInfoViewModel (
//                price: priceInfo.price,
//                day: priceInfo.date,
//                color: coinInfo.getColor(index: index)
//            )
//        }
    }

}


extension String {

    func toDate(withFormat format: String = "MM/dd/yyyy")-> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
}

extension Date {

    func toString(withFormat format: String = "MM/dd/yyyy") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}
