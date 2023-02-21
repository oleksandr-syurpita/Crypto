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

    
    @Published var coinsTemp = [Coins]()
    @Published var detailsNews =  [News]()
    @Published var detailsPeriodPrices = [PeriodPrices]()
    @Published var coins = CheckCoin(data: [Coins(id: "", name: "", price: 132.12, imageURL: "")])
    @Published var details = Price(
        currentPrice: 32.12,
        periodPrices: [PeriodPrices(id: "", date: "", price: 123.21)],
        news: [News(id: "", date: "", title: "", url: "")])
    
    @Published var errorHandler = false
    @Published var errorText = ""
//    Date(DateFormatter.yearMonthDay.string(from: Date.now))
//    2022:05:12(DateFormatter.yearMonthDay)
    let apiModel: ApiModel
    var coinName: Coins
    
    init(coinName: Coins,apiModel: ApiModel) {
        self.coinName = coinName
        self.apiModel = apiModel
    }
    
    let newsModels: [News] = [
        News(id: "", date: "", title: "TEST Update", url: ""),
        News(id: "", date: "", title: "TEST Update", url: ""),
        News(id: "", date: "", title: "TEST Update", url: "")
    ]
    
    func checkDetails() {

    }
    
    
    func navigationBack() {
        onResult?(.navigationBack)
    }
}


extension DateFormatter {
    static let standardT: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter
    }()

    static let standard: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }()

    static let yearMonthDay: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
}
