//
//  ApiService.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 20.02.2023.
//

import Foundation

class ApiModel: ObservableObject {
    
    func apiCheck(completion: @escaping (Result<TestApi,NetworkError>) -> Void) {
        guard let url = URL(string: "https://crypto2211.000webhostapp.com/test.php") else {  return }
        let request = URLRequest(url: url)
         URLSession.shared.dataTask(with: request) { (data, responses, error)in
            guard let responses = responses as? HTTPURLResponse else {return}
            guard let data = data else {return}
            if responses.statusCode == 200 {
                DispatchQueue.main.async {
                    do {
                        let decode = try JSONDecoder().decode(TestApi.self, from: data)
                        completion(.success(decode))
                    }
                    catch {
                        print("error decode")
                    }
                }
            }else {
                completion(.failure(NetworkError.error))
            }
        }.resume()
    }
    
    func coinCheck(completion: @escaping (Result<CheckCoin,NetworkError>) -> Void) {
        guard let url = URL(string: "https://crypto2211.000webhostapp.com/getCoins.php") else {  return }
        let request = URLRequest(url: url)
         URLSession.shared.dataTask(with: request) { (data, responses, error)in
            guard let responses = responses as? HTTPURLResponse else {return}
            guard let data = data else {return}
            if responses.statusCode == 200 {
                DispatchQueue.main.async {
                    do {
                        let decode = try JSONDecoder().decode(CheckCoin.self, from: data)
                        completion(.success(decode))
                    }
                    catch {
                        print("error decode")
                    }
                }
            }else {
                completion(.failure(NetworkError.error))
            }
        }.resume()
    }
    
    func detailsCheck(id: String ,completion: @escaping (Price) -> Void) {
        guard let url = URL(string: "https://crypto2211.000webhostapp.com/getDetails.php?id=\(id)") else {  return }
        let request = URLRequest(url: url)
         URLSession.shared.dataTask(with: request) { (data, responses, error)in
            guard let responses = responses as? HTTPURLResponse else {return}
            guard let data = data else {return}
             if responses.statusCode == 200 {
                 DispatchQueue.main.async {
                     do {
                         let decode = try JSONDecoder().decode(Price.self, from: data)
                         completion(decode)
                     }
                     catch {
                         print("Here error -->  \(error)")
                     }
                 }
             }
        }.resume()
    }

}

struct TestApi: Codable, Identifiable {
    
    let id: String
    let prop1: Int
    let prop2: Bool
}

struct CheckCoin: Codable {
    
    let data: [Coins]
}

struct Coins: Codable,Identifiable {
    
    let id: String
    let name: String
    let price: Double
    let imageURL: String
}

struct Price: Codable {
    let currentPrice: Double
    let periodPrices: [PeriodPrices]
    let news: [News]
}

struct News: Codable,Identifiable {
        
    let id: String
    let date: String
    let title: String
    let url: String
    
}

struct PeriodPrices: Codable {

    let id: String
    let date: String
    let price: Double
}
