//
//  ViewController.swift
//  Crypto
//
//  Created by Ryan Rouxinol on 21/08/24.
//

import UIKit


class ViewController: UIViewController {
    private let wishlistNotifications = WishlistNotifications()
    
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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Hi, There!"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.WhiteAsset
        return label
    }()
    
    private lazy var watchlistLabel: UILabel = {
        let label = UILabel()
        label.text = "watchlist"
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.whiteAsset
        return label
    }()
    
    private lazy var editButtonWishlist: UIButton = {
        let button = UIButton()
        button.setTitle("edit", for: .normal)
        button.backgroundColor = UIColor.darkGray
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var wishListStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [watchlistLabel, editButtonWishlist])
        stackview.axis = .horizontal
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 8
        return stackview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        wishlistNotifications.checkForPermission()
    }
    
    private func setupView(){
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        view.addSubview(backgroundView)
        view.addSubview(cryptoIcon)
        view.addSubview(welcomeLabel)
        view.addSubview(wishListStackView)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cryptoIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            cryptoIcon.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            cryptoIcon.heightAnchor.constraint(equalToConstant: 45),
            cryptoIcon.widthAnchor.constraint(equalToConstant: 180),
            
            welcomeLabel.topAnchor.constraint(equalTo: cryptoIcon.bottomAnchor, constant: 12),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12)
            
        ])
        
        NSLayoutConstraint.activate([
            wishListStackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 11),
            wishListStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            editButtonWishlist.widthAnchor.constraint(equalToConstant: 48)
           
        ])
         }
}

