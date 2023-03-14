//
//  ListBooksViewController.swift
//  BookStore
//
//  Created by Arthur Borges Conforti on 12/03/23.
//

import Foundation
import UIKit

class ListBooksViewController: UIViewController {
    
    var viewModel : ListBooksViewModel!
    
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
        view.register(ListBooksViewCell.self, forCellWithReuseIdentifier: "cell")
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchBooks()
        setupHeader()
        setupLabels()
        setupCollectionView()
        setupBindable()
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setupBindable() {
        self.viewModel.updateListSections.bind { [weak self] updateListSections in
            self?.collectionView.reloadData()
        }
    }
    
    private func setupHeader() {
        view.backgroundColor = .white
        navigationItem.title = "BookStore"
    }
    
    private func setupLabels() {
        titleLabel.text = "iOS Books"
        titleLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupConstraints() {
        titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
    }
    
}

extension ListBooksViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.1, height: collectionView.frame.height/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.booksResponses?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ListBooksViewCell
        cell?.titleBook.text = viewModel.booksResponses?.items[indexPath.row].volumeInfo.title
        cell?.urlImage = viewModel.booksResponses?.items[indexPath.row].volumeInfo.imageLinks?.smallThumbnail ?? ""
        cell?.publisherBook.text = viewModel.booksResponses?.items[indexPath.row].volumeInfo.publisher
        cell?.dateBook.text = "Date:\(viewModel.booksResponses?.items[indexPath.row].volumeInfo.publishedDate ?? "")"
        cell?.startItemCell()
        cell?.setupForSaleBackground(typeForSale: saleabilitySale(rawValue: (viewModel.booksResponses?.items[indexPath.row].saleInfo.saleability)!) ?? .forSale)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let model = viewModel.booksResponses?.items[indexPath.row] else { return }
        viewModel.tapBookDetail(item: model)
    }
}



