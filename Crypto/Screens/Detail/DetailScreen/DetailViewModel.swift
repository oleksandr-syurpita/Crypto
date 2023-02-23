//
//  DetailViewModel.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    enum Result {
        case navigationBack
    }

    var onResult: ((Result) -> Void)?
    
    @Published var detailsNews =  [News]()
    @Published var errorHandler = false
    @Published var loading = true
    @Published var price = Price(
        currentPrice: 3232.123,
        periodPrices: [
            PeriodPrices(
                id: String(),
                date: String(),
                price: 231.32)],
        news: [
            News(
                id: String(),
                date: String(),
                title: String(),
                url: String()
            )
        ]
    )
    
    let apiModel: ApiModel
    var coin: Coins

    init(coin: Coins,apiModel: ApiModel) {
        self.coin = coin
        self.apiModel = apiModel
    }
    
    func checkDetail() {
        apiModel.testDetail(id: coin.id) { result in
            switch result {
            case .success(let detail):
                self.price = detail
                for news in detail.news {
                    self.detailsNews.append(news)
                    self.loading = false
                }
            case .failure(let error):
                if error == .error {
                    self.errorHandler = true
                }
            }
        }
    }
    
    func navigationBack() {
        onResult?(.navigationBack)
    }
}
