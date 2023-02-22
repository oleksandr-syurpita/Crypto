//
//  MainViewModel.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import Foundation

class IntroViewModel: ObservableObject {
    
    
    
    enum Result {
        case navigationNext(coins: Coins)
    }
    
    @Published var animation = false
    @Published var animationButton = false
    @Published var errorHandler = false
    @Published var coinsTemp = [Coins]()
    
    let apiModel: ApiModel
    var onResult:((Result) -> Void)?
    var checkApi = TestApi(id: "", prop1: 1, prop2: false)
    var coins = CheckCoin(data: [Coins(id: "", name: "", price: 132.12, imageURL: "")])
    
    init(apiModel: ApiModel) {
        self.apiModel = apiModel
    }
        
    func checkCoins() {
        apiModel.coinCheck { result in
            switch result {
            case .success(let coins):
                self.coins = coins
                for string in self.coins.data {
                    self.coinsTemp.append(string)
                }
            case .failure(let error):
                if error == .error {
                    self.errorHandler = true
                }
            }
        }
    }
    
    func navigation(coins: Coins) {
        onResult?(.navigationNext(coins: coins))
    }
}
