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
    }
    
    private func setHierarchy(){
        view.addSubview(backgroundView)
        view.addSubview(cryptoIcon)
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

