//
//  DetailBookViewController.swift
//  BookStore
//
//  Created by Arthur Borges Conforti on 13/03/23.
//

import Foundation
import UIKit

class DetailBookViewController: UIViewController {
    var viewModel : DetailBooksViewModel!
    
    private lazy var imageBook: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    
    private lazy var titleBook: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var authorsBook: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var publisherTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var publisherBook: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dateTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dateBook: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priceTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priceBook: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ratingTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ratingBook: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var imageBookmarks: UIButton = {
        let view = UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buyBook: UIButton = {
        let view = UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Not Available!", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.cornerRadius = 4
        view.backgroundColor = .red
        view.isEnabled = false
        return view
    }()

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var descriptionBook: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var reviewTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        setupScrollView()
        setupLabels()
        setupImageViews()
        view.addSubview(imageBook)
        view.addSubview(titleBook)
        view.addSubview(authorsBook)
        view.addSubview(publisherTitle)
        view.addSubview(publisherBook)
        view.addSubview(dateTitle)
        view.addSubview(dateBook)
        view.addSubview(priceTitle)
        view.addSubview(priceBook)
        view.addSubview(ratingTitle)
        view.addSubview(ratingBook)
        view.addSubview(imageBookmarks)
        view.addSubview(buyBook)
        view.addSubview(reviewTitle)
        view.addSubview(scrollView)
        scrollView.addSubview(descriptionBook)
        setupConstraints()
    }
    
    private func setupHeader() {
        view.backgroundColor = .white
        navigationItem.title = "BookStore"
        navigationItem.backBarButtonItem?.title = "Back"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorites", style: .plain, target: self, action: #selector(actionGoFavorite))
    }
    
    private func setupLabels() {
        titleBook.text = viewModel.booksResponses.volumeInfo.title
        titleBook.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        titleBook.numberOfLines = 0
        
        authorsBook.text = viewModel.booksResponses.volumeInfo.authors?.joined(separator:",")
        authorsBook.font = UIFont.systemFont(ofSize: 10.0, weight: .regular)
        authorsBook.numberOfLines = 0
        
        publisherTitle.text = "Publisher:"
        publisherTitle.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        publisherTitle.numberOfLines = 0
        
        publisherBook.text = viewModel.booksResponses.volumeInfo.publisher
        publisherBook.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        publisherBook.numberOfLines = 0
        
        dateTitle.text = "Date:"
        dateTitle.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        dateTitle.numberOfLines = 0
        dateTitle.textAlignment = .left
        
        dateBook.text = viewModel.booksResponses.volumeInfo.publishedDate
        dateBook.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        dateBook.numberOfLines = 0
        
        priceTitle.text = "Price:"
        priceTitle.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        priceTitle.numberOfLines = 0
        
        let value = String(format: "%.2f", viewModel.booksResponses.saleInfo.listPrice?.amount ?? 0.0)
        priceBook.text = "\(value)€"
        priceBook.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        priceBook.numberOfLines = 0
        
        ratingTitle.text = "Rating:"
        ratingTitle.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        ratingTitle.numberOfLines = 0
        
        let rating = String(format: "%.2f", viewModel.booksResponses.volumeInfo.averageRating ?? 0.0)
        ratingBook.text = rating
        ratingBook.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        ratingBook.numberOfLines = 0
    
        reviewTitle.text = "Review"
        reviewTitle.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        
        descriptionBook.text = viewModel.booksResponses.volumeInfo.description
        descriptionBook.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        descriptionBook.numberOfLines = 0
        descriptionBook.sizeToFit()
        
        if viewModel.booksResponses.saleInfo.saleability == saleabilitySale.forSale.rawValue {
            buyBook.backgroundColor = .yellow
            buyBook.isEnabled = true
            buyBook.setTitle("Buy Now!", for: .normal)
            buyBook.addTarget(self, action: #selector(actionBuyButton), for: .touchUpInside)
            
        }
        
        imageBookmarks.setImage(UIImage(systemName:"heart.fill"), for: .normal)
        imageBookmarks.backgroundColor = .white
        imageBookmarks.tintColor = .systemGray5
        imageBookmarks.addTarget(self, action: #selector(actionFavorites), for: .touchUpInside)

    }
    
    private func setupImageViews() {
        
        guard let url = URL(string: viewModel.booksResponses.volumeInfo.imageLinks?.smallThumbnail ?? "") else {
           return
       }
        imageBook.load(url: url)
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        imageBook.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        imageBook.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        imageBook.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2.5).isActive = true
        imageBook.heightAnchor.constraint(equalToConstant: 168).isActive = true
        
        titleBook.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        titleBook.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        titleBook.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: 10).isActive = true
        
        authorsBook.topAnchor.constraint(equalTo: self.titleBook.bottomAnchor, constant: 0).isActive = true
        authorsBook.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        authorsBook.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: 10).isActive = true
        
        publisherTitle.topAnchor.constraint(equalTo: self.authorsBook.bottomAnchor, constant: 10).isActive = true
        publisherTitle.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: 10).isActive = true
        
        publisherBook.topAnchor.constraint(equalTo: self.publisherTitle.bottomAnchor, constant: 0).isActive = true
        publisherBook.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: 10).isActive = true
        
        dateTitle.topAnchor.constraint(equalTo: self.authorsBook.bottomAnchor, constant: 10).isActive = true
        dateTitle.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        dateTitle.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        dateBook.topAnchor.constraint(equalTo: self.dateTitle.bottomAnchor, constant: 0).isActive = true
        dateBook.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        reviewTitle.topAnchor.constraint(equalTo: self.imageBook.bottomAnchor, constant: 50).isActive = true
        reviewTitle.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        reviewTitle.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        priceTitle.topAnchor.constraint(equalTo: self.publisherBook.bottomAnchor, constant: 10).isActive = true
        priceTitle.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: 10).isActive = true
        
        priceBook.topAnchor.constraint(equalTo: self.priceTitle.bottomAnchor, constant: 0).isActive = true
        priceBook.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: 10).isActive = true
        
        ratingTitle.topAnchor.constraint(equalTo: self.publisherBook.bottomAnchor, constant: 10).isActive = true
        ratingTitle.leadingAnchor.constraint(equalTo: priceTitle.trailingAnchor, constant: 20).isActive = true
        
        ratingBook.topAnchor.constraint(equalTo: self.ratingTitle.bottomAnchor, constant: 0).isActive = true
        ratingBook.leadingAnchor.constraint(equalTo: priceBook.trailingAnchor, constant: 20).isActive = true
        
        imageBookmarks.topAnchor.constraint(equalTo: self.dateBook.topAnchor, constant: 10).isActive = true
        imageBookmarks.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        imageBookmarks.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageBookmarks.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        buyBook.topAnchor.constraint(equalTo: self.priceBook.bottomAnchor, constant: 10).isActive = true
        buyBook.leadingAnchor.constraint(equalTo: imageBook.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        buyBook.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        scrollView.topAnchor.constraint(equalTo: self.reviewTitle.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
        descriptionBook.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 10).isActive = true
        descriptionBook.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 0).isActive = true
        descriptionBook.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: 0).isActive = true
        descriptionBook.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 0.0).isActive = true
        descriptionBook.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: 0.0).isActive = true
        
    }
    
    @objc private func actionBuyButton(_ sender: UIButton) {
        if let url = URL(string: viewModel.booksResponses.saleInfo.buyLink ?? ""), !url.absoluteString.isEmpty {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc private func actionFavorites(_ sender: UIButton) {
        imageBookmarks.tintColor = viewModel.tapFavorite(value: !(viewModel.booksResponses.favorite ?? false))
    }
    
    @objc private func actionGoFavorite(_ sender: UIButton) {
        viewModel.tapListFavorite()
    }
}
