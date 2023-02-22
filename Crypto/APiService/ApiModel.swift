//
//  ApiService.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 20.02.2023.
//

import Foundation

class ApiModel: ObservableObject {
        
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
    
    func testDetail(id: String ,completion: @escaping (Result<Price,NetworkError>) -> Void) {
        guard let url = URL(string: "https://crypto2211.000webhostapp.com/getDetails.php?id=\(id)") else {  return }
        let request = URLRequest(url: url)
         URLSession.shared.dataTask(with: request) { (data, responses, error)in
            guard let responses = responses as? HTTPURLResponse else {return}
            guard let data = data else {return}
             if responses.statusCode == 200 {
                 DispatchQueue.main.async {
                     do {
                         let decode = try JSONDecoder().decode(Price.self, from: data)
                         completion(.success(decode))
                     }
                     catch {
                         print("Here error -->  \(error)")
                     }
                 }
             } else {
             completion(.failure(NetworkError.error))
         }
        }.resume()
    }
}
