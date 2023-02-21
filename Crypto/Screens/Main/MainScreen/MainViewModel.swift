//
//  MainViewModel.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    
    enum Result {
        case navigationToDetail(detail: Coins)
        case navigationSettings
    }
    
    var onResult: ((Result) -> Void)?
    let apiModel: ApiModel

    let coin: [Coins] = [
        Coins(id: "Bitcoin", name: "Bitcoin", price: 21.188, imageURL: "TestImage"),
        Coins(id: "2", name: "2", price: 21.188, imageURL: "TestImage"),
        Coins(id: "3", name: "3", price: 21.188, imageURL: "TestImage"),
        Coins(id: "4", name: "4", price: 21.188, imageURL: "TestImage"),
        Coins(id: "5", name: "5", price: 21.188, imageURL: "TestImage"),
        Coins(id: "6", name: "6", price: 21.188, imageURL: "TestImage"),
    ]
    
    @Published var coinsTemp = [Coins]()
    @Published var errorHandler = false
    @Published var errorText = ""
    @Published var coins = CheckCoin(data: [Coins(id: "", name: "", price: 132.12, imageURL: "")])


    func moveToDetails(detail: Coins) {
        onResult?(.navigationToDetail(detail: detail))
    }
    
    func moveToSettings() {
        onResult?(.navigationSettings)
    }

    init(apiModel: ApiModel) {
        self.apiModel = apiModel
    }
    
    
    func checkCoins() {
        apiModel.coinCheck { result in
            switch result {
            case .success(let coins):
                self.coins = coins
                
                for string in self.coins.data {
                    print(string.id)
//                    print(string.name)
//                    print(string.price)
                    self.coinsTemp.append(string)
                }
//                print(self.coinsTemp)
            case .failure(let error):
                if error == .error {
                    self.errorText = "Error alert"
                    self.errorHandler = true
                }
            }
        }
    }
}

