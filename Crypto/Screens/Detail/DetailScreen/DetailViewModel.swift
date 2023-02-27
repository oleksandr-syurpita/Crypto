//
//  DetailViewModel.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import Foundation
import UIKit

class DetailViewModel: ObservableObject {
    
    enum Result {
        case navigationBack
    }
    
    var onResult: ((Result) -> Void)?
    var urlString = String()
    let apiModel: ApiModel
    var coin: Coins
    
    @Published var detailsNews =  [News]()
    @Published var errorHandler = false
    @Published var loading = true
    @Published var price = CoinDetails(
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
    
    init(coin: Coins,apiModel: ApiModel) {
        self.coin = coin
        self.apiModel = apiModel
    }
    
    func checkDetail() {
        apiModel.detailsCheck(id: coin.id) { result in
            switch result {
            case .success(let detail):
                self.price = detail
                for news in detail.news {
                    self.detailsNews.append(news)
                    self.urlString = news.url
                    self.loading = false
                }
            case .failure(let error):
                if error == .error {
                    self.errorHandler = true
                }
            }
        }
    }
    
    func openURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
    
    func navigationBack() {
        onResult?(.navigationBack)
    }
}
