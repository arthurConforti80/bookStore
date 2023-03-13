//
//  CollectionViewCell.swift
//  BookStore
//
//  Created by Arthur Borges Conforti on 13/03/23.
//

import UIKit

class ListBooksViewCell: UICollectionViewCell {
    
    lazy var imageBook: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    lazy var titleBook: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var publisherBook: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dateBook: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var forSaleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var urlImage = ""
    
    //var onImage = Image(systemName: "star.fill")
    
    func startItemCell() {
        setupUICell()
        setupImagemView()
        setupLabel()
        self.addSubview(imageBook)
        self.addSubview(titleBook)
        self.addSubview(publisherBook)
        self.addSubview(dateBook)
        self.addSubview(forSaleLabel)
        setupConstraints()
        
    }
    
    private func setupUICell() {
        self.layer.borderColor = UIColor.systemGray5.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 4
    }
    
    private func setupLabel() {
        titleBook.font = UIFont.systemFont(ofSize: 13.0, weight: .bold)
        titleBook.textAlignment = .center
        titleBook.numberOfLines = 2
        
        publisherBook.font = UIFont.systemFont(ofSize: 11.0, weight: .regular)
        publisherBook.textAlignment = .center
        publisherBook.numberOfLines = 0
        
        publisherBook.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        publisherBook.textAlignment = .center
        publisherBook.numberOfLines = 0
        
        dateBook.font = UIFont.systemFont(ofSize: 11.0, weight: .bold)
        dateBook.textAlignment = .center
        dateBook.numberOfLines = 0
        
        forSaleLabel.font = UIFont.systemFont(ofSize: 13.0, weight: .bold)
        forSaleLabel.textAlignment = .center
        forSaleLabel.numberOfLines = 0
    }
    
    private func setupImagemView() {
        guard let url = URL(string: urlImage) else {
           return
       }
        imageBook.load(url: url)
    }
    
    private func setupConstraints() {
        imageBook.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        imageBook.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        imageBook.widthAnchor.constraint(equalToConstant: self.contentView.frame.width/2.5).isActive = true
        imageBook.heightAnchor.constraint(equalToConstant: self.contentView.frame.height/2).isActive = true
        
        titleBook.topAnchor.constraint(equalTo: imageBook.bottomAnchor, constant: 15).isActive = true
        titleBook.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        titleBook.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        
        publisherBook.topAnchor.constraint(equalTo: titleBook.bottomAnchor, constant: 10).isActive = true
        publisherBook.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        publisherBook.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        
        dateBook.topAnchor.constraint(equalTo: publisherBook.bottomAnchor, constant: 10).isActive = true
        dateBook.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        dateBook.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        
        forSaleLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        forSaleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        forSaleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
    }
    
    
    public func setupForSaleBackground(typeForSale: saleabilitySale) {
        switch typeForSale {
        case .forSale:
            forSaleLabel.backgroundColor = .green
            forSaleLabel.text = "Avaliable"
        case .notForSale:
            forSaleLabel.backgroundColor = .red
            forSaleLabel.text = "Not Avaliable"
        }
        
        forSaleLabel.layer.borderWidth = 1
        forSaleLabel.layer.cornerRadius = 4
    }
}
