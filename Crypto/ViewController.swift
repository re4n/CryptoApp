//
//  ViewController.swift
//  Crypto
//
//  Created by Ryan Rouxinol on 02/11/24.
//

import UIKit

class ViewController: UIViewController {
    private let watchListNotification = WatchListNotifications()
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.bgDarkModeAsset
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private lazy var cryptoIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoApp")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        watchListNotification.checkForPermission()
    }
    
    private func setupView(){
        setHierarchy()
        setConstraints()
//        setupCryptoServices()
    }
    
    private func setHierarchy(){
        view.addSubview(backgroundView)
        view.addSubview(cryptoIcon)
    }
    
    private func setupCryptoServices() {
        let service = CryptoServices()
        service.fetchCryptos { [weak self] cryptos in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if let cryptos = cryptos {
                    for crypto in cryptos {
                        let formattedChangePercent = self.formatPercentage(crypto.priceChangePercentage24h)
                        print("Nome: \(crypto.name), Símbolo: \(crypto.symbol), Preço: \(crypto.currentPrice), Variação 24h: \(formattedChangePercent)%")
                    }
                } else {
                    print("Nenhuma criptomoeda encontrada.")
                }
            }
        }
    }

    private func formatPercentage(_ percentage: Double?) -> String {
        guard let percentage = percentage else { return "N/A" }
        return String(format: "%.2f", percentage)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cryptoIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            cryptoIcon.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            cryptoIcon.heightAnchor.constraint(equalToConstant: 45),
            cryptoIcon.widthAnchor.constraint(equalToConstant: 180),
        ])
    }


}

