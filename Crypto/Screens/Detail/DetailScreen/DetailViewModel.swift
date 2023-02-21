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
    @Published var errorText = ""

    let apiModel: ApiModel
    var coin: Coins
    
    init(coin: Coins,apiModel: ApiModel) {
        self.coin = coin
        self.apiModel = apiModel
    }
    
    func checkDetails() {
        apiModel.detailsCheck(id: coin.id) { detail in
            for news in detail.news {
                self.detailsNews.append(news)
            }
        }
    }
    
    func navigationBack() {
        onResult?(.navigationBack)
    }
}
