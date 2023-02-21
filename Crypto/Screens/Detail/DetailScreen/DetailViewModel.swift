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
    var tempString: [String] = []
    var tempDate: [Date] = []
    
    init(coin: Coins,apiModel: ApiModel) {
        self.coin = coin
        self.apiModel = apiModel
    }
    
    func checkDetails() {
        apiModel.detailsCheck(id: coin.id) { detail in
            for news in detail.news {
                self.detailsNews.append(news)
                self.tempString.append(news.date)
            }
//
//            print("next time")

            for temp in self.tempDate {
                print(temp)
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
