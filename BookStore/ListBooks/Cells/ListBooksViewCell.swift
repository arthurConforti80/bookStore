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
        self.layer.borderWidth = borderCell
        self.layer.cornerRadius = cornerRadiusCell
    }
    
    private func setupLabel() {
        titleBook.font = UIFont.systemFont(ofSize: sizeTitleFont, weight: .bold)
        titleBook.textAlignment = .center
        titleBook.numberOfLines = numberLinesTitle
        
        publisherBook.font = UIFont.systemFont(ofSize: sizePublisherFont, weight: .regular)
        publisherBook.textAlignment = .center
        publisherBook.numberOfLines = numberLines
        
        dateBook.font = UIFont.systemFont(ofSize: sizeDateBookFont, weight: .bold)
        dateBook.textAlignment = .center
        dateBook.numberOfLines = numberLines
        
        forSaleLabel.font = UIFont.systemFont(ofSize: sizeForSaleFont, weight: .bold)
        forSaleLabel.textAlignment = .center
        forSaleLabel.numberOfLines = numberLines
    }
    
    private func setupImagemView() {
        guard let url = URL(string: urlImage) else {
           return
       }
        imageBook.load(url: url)
    }
    
    private func setupConstraints() {
        imageBook.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: paddingTopImage).isActive = true
        imageBook.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: paddingEmpty).isActive = true
        imageBook.widthAnchor.constraint(equalToConstant: self.contentView.frame.width/widthImage).isActive = true
        imageBook.heightAnchor.constraint(equalToConstant: self.contentView.frame.height/heightImage).isActive = true
        
        titleBook.topAnchor.constraint(equalTo: imageBook.bottomAnchor, constant: paddingTopCell).isActive = true
        titleBook.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: paddingTrailingCell).isActive = true
        titleBook.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: paddingLeadingCell).isActive = true
        
        publisherBook.topAnchor.constraint(equalTo: titleBook.bottomAnchor, constant: paddingTopCell).isActive = true
        publisherBook.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: paddingTrailingCell).isActive = true
        publisherBook.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: paddingLeadingCell).isActive = true
        
        dateBook.topAnchor.constraint(equalTo: publisherBook.bottomAnchor, constant: paddingTopCell).isActive = true
        dateBook.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: paddingTrailingCell).isActive = true
        dateBook.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: paddingLeadingCell).isActive = true
        
        forSaleLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: paddingBottonCell).isActive = true
        forSaleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: paddingTrailingCell).isActive = true
        forSaleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: paddingLeadingCell).isActive = true
    }
    
    
    public func setupForSaleBackground(typeForSale: saleabilitySale) {
        switch typeForSale {
        case .forSale:
            forSaleLabel.backgroundColor = .green
            forSaleLabel.text = forSaleText
        case .notForSale:
            forSaleLabel.backgroundColor = .red
            forSaleLabel.text = NotForSaleText
        }
        
        forSaleLabel.layer.borderWidth = borderCell
        forSaleLabel.layer.cornerRadius = cornerRadiusCell
    }
}
