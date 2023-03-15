//
//  FavoriteBookViewController.swift
//  BookStore
//
//  Created by Arthur Borges Conforti on 14/03/23.
//

import Foundation
import UIKit

class FavoriteBooksViewController: UIViewController {
    
    var viewModel : FavoriteBooksViewModel!
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(ListBooksViewCell.self, forCellWithReuseIdentifier: nameCellList)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchFavoriteList()
        setupHeader()
        setupLabels()
        setupCollectionView()
        setupBindable()
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        setupConstraints()
    }
    
    func setupBindable() {
        self.viewModel.updateListSections.bind { [weak self] updateListSections in
            self?.collectionView.reloadData()
        }
    }
    
    private func setupHeader() {
        view.backgroundColor = .white
        navigationItem.title = nameAPP
        let myButton = UIButton(type: .system)
        let image = UIImage(named: imageArrows)
        myButton.setImage(image, for: .normal)
        myButton.setTitle(nameBackScreen, for: .normal)
        myButton.sizeToFit()
        myButton.addTarget(self, action: #selector(actionGoHome), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: myButton)
    }
    
    private func setupLabels() {
        titleLabel.text = subtitleApp
        titleLabel.font = UIFont.systemFont(ofSize: sizeTitleLabel, weight: .semibold)
        titleLabel.textAlignment = .center
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupConstraints() {
        titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: paddingTop).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: paddingTrailing).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: paddingLeading).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: paddingTop).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: paddingTrailing).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: paddingLeading).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: paddingEmpty).isActive = true
        
    }
    

    @objc private func actionGoHome(_ sender: UIButton) {
        viewModel.tapHoHome()
    }
    
}

extension FavoriteBooksViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/widthCellCollectionView, height: collectionView.frame.height/heightCellCollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.booksList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nameCellList, for: indexPath) as? ListBooksViewCell
        cell?.titleBook.text = viewModel.booksList[indexPath.row].volumeInfo.title
        cell?.urlImage = viewModel.booksList[indexPath.row].volumeInfo.imageLinks?.smallThumbnail ?? ""
        cell?.publisherBook.text = viewModel.booksList[indexPath.row].volumeInfo.publisher
        cell?.dateBook.text = "\(labelDate):\(viewModel.booksList[indexPath.row].volumeInfo.publishedDate ?? "")"
        cell?.startItemCell()
        cell?.setupForSaleBackground(typeForSale: saleabilitySale(rawValue: (viewModel.booksList[indexPath.row].saleInfo.saleability)!) ?? .forSale)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = viewModel.booksList[indexPath.row]
        viewModel.tapBookDetail(item: model.id)
    }
}




