//
//  CollectionViewCell.swift
//  BookStore
//
//  Created by Arthur Borges Conforti on 13/03/23.
//

import UIKit

class ListBooksViewCell: UICollectionViewCell {
    
    private lazy var viewItem: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func startItemCell() {
        self.backgroundColor = .systemGray6
        setupView()
        self.addSubview(viewItem)
        setupConstraints()
        
    }
    
    func setupView() {
        viewItem.backgroundColor = .white
        viewItem.layer.cornerRadius = 8
    }
    
    func setupConstraints() {
        viewItem.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        viewItem.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        viewItem.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        viewItem.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
}
