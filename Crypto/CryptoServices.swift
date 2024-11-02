//
//  CryptoServices.swift
//  Crypto
//
//  Created by Ryan Rouxinol on 02/11/24.
//

import Foundation

class CryptoServices {
    
    private let baseURL: String = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false"
    private let session = URLSession.shared
    
    func fetchCryptos(_ completion: @escaping ([Crypto]?) -> Void) {
        guard let url = URL(string: baseURL) else {
            print("URL inválida")
            completion(nil)
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Erro na requisição: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("Nenhum dado retornado")
                completion(nil)
                return
            }
            
            do {
                let cryptoResponse = try JSONDecoder().decode([Crypto].self, from: data)
                completion(cryptoResponse)
            } catch {
                print("Erro ao decodificar JSON: \(error)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}

// MARK: - Crypto
struct Crypto: Codable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let priceChangePercentage24h: Double?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case priceChangePercentage24h = "price_change_percentage_24h"
        case currentPrice = "current_price"
    }
}
