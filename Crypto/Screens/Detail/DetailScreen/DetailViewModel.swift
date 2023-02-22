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
    @Published var price = Price(currentPrice: 3232.123, periodPrices: [PeriodPrices(id: "", date: "", price: 231.32)], news: [News(id: "", date: "", title: "", url: "")])
    let apiModel: ApiModel
    var coin: Coins

    init(coin: Coins,apiModel: ApiModel) {
        self.coin = coin
        self.apiModel = apiModel
    }
    
    
    func checkDetail() {
        apiModel.testDetail(id: coin.id) { detail in
            switch detail {
            case .success(let price):
                self.price = price
                for news in price.news {
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

struct NewNews: Identifiable {
    let id: String
    let date: Date
    let title: String
    let url: String
}
