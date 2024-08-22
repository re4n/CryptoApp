//
//  ViewController.swift
//  Crypto
//
//  Created by Ryan Rouxinol on 21/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .backgroundDarkMode
        let service = CryptoService()
        service.fetchCryptos { cryptos in
            if let cryptos = cryptos {
                for crypto in cryptos {
                    let formattedChangePercent = self.formatPercentage(crypto.changePercent24Hr)
                    let formattedChangePrice = self.formatPercentage(crypto.priceUsd)
                    print("Nome: \(crypto.name), Preço: \(formattedChangePrice), Variação 24h: \(formattedChangePercent)%")
                }
            } else {
                print("Nenhuma criptomoeda encontrada.")
            }
        }
    }

    func formatPercentage(_ value: String) -> String {
        if let doubleValue = Double(value) {
            return String(format: "%.2f", doubleValue)
        } else {
            return value
        }
    }
}
