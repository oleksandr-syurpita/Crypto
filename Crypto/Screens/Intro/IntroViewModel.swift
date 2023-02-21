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
    @Published var errorText = ""
    @Published var coinsTemp = [Coins]()

    var onResult:((Result) -> Void)?
    let apiModel: ApiModel
    var checkApi = TestApi(id: "", prop1: 1, prop2: false)
    var coins = CheckCoin(data: [Coins(id: "", name: "", price: 132.12, imageURL: "")])
    
    init(apiModel: ApiModel) {
        self.apiModel = apiModel
    }
    
    func apiCallCheck() {
        apiModel.apiCheck { result in
            switch result {
            case .success(let check):
                self.checkApi = check
                print(check.id)
                print(check.prop1)
                print(check.prop2)
                self.checkCoins()

            case .failure(let error):
                if error == .error {
                    self.errorText = "Error alert"
                    self.errorHandler = true
                }
            }
        }
    }
    
    func checkCoins() {
        apiModel.coinCheck { result in
            switch result {
            case .success(let coins):
                self.coins = coins
                
                for string in self.coins.data {
//                    print(string.id)
//                    print(string.name)
//                    print(string.price)
//                    print(string.imageURL)

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
    
    func navigation(coins: Coins) {
        onResult?(.navigationNext(coins: coins))
    }
}
