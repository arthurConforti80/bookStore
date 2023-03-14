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
        navigationItem.title = nameScreen
        navigationItem.backBarButtonItem?.title = leftLabel
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: rightLabel, style: .plain, target: self, action: #selector(actionGoFavorite))
    }
    
    private func setupLabels() {
        titleBook.text = viewModel.booksResponses?.volumeInfo.title
        titleBook.font = UIFont.systemFont(ofSize: sizeTitleBook, weight: .bold)
        titleBook.numberOfLines = numberLines
        
        authorsBook.text = viewModel.booksResponses?.volumeInfo.authors?.joined(separator:",")
        authorsBook.font = UIFont.systemFont(ofSize: sizeAuthorsBook, weight: .regular)
        authorsBook.numberOfLines = numberLines
        
        publisherTitle.text = namePublisherLabel
        publisherTitle.font = UIFont.systemFont(ofSize: sizePublisherTitle, weight: .bold)
        publisherTitle.numberOfLines = numberLines
        
        publisherBook.text = viewModel.booksResponses?.volumeInfo.publisher
        publisherBook.font = UIFont.systemFont(ofSize: sizePublisherData, weight: .regular)
        publisherBook.numberOfLines = numberLines
        
        dateTitle.text = nameDateTitle
        dateTitle.font = UIFont.systemFont(ofSize: sizeDateTitle, weight: .bold)
        dateTitle.numberOfLines = numberLines
        dateTitle.textAlignment = .left
        
        dateBook.text = viewModel.booksResponses?.volumeInfo.publishedDate
        dateBook.font = UIFont.systemFont(ofSize: sizeDateData, weight: .regular)
        dateBook.numberOfLines = numberLines
        
        priceTitle.text = namePriceTitle
        priceTitle.font = UIFont.systemFont(ofSize: sizePriceTitle, weight: .bold)
        priceTitle.numberOfLines = 0
        
        let value = String(format: "%.2f", viewModel.booksResponses?.saleInfo.listPrice?.amount ?? 0.0)
        priceBook.text = "\(value)€"
        priceBook.font = UIFont.systemFont(ofSize: sizePriceData, weight: .bold)
        priceBook.numberOfLines = numberLines
        
        ratingTitle.text = nameRatingTitle
        ratingTitle.font = UIFont.systemFont(ofSize: sizeRatingTitle, weight: .bold)
        ratingTitle.numberOfLines = numberLines
        
        let rating = String(format: "%.2f", viewModel.booksResponses?.volumeInfo.averageRating ?? 0.0)
        ratingBook.text = rating
        ratingBook.font = UIFont.systemFont(ofSize: sizeRatingData, weight: .regular)
        ratingBook.numberOfLines = numberLines
    
        reviewTitle.text = nameReviewTitle
        reviewTitle.font = UIFont.systemFont(ofSize: sizeReviewTitle, weight: .bold)
        
        descriptionBook.text = viewModel.booksResponses?.volumeInfo.description
        descriptionBook.font = UIFont.systemFont(ofSize: sizeDescriptionData, weight: .regular)
        descriptionBook.numberOfLines = numberLines
        descriptionBook.sizeToFit()
        
        if viewModel.booksResponses?.saleInfo.saleability == saleabilitySale.forSale.rawValue {
            buyBook.backgroundColor = .yellow
            buyBook.isEnabled = true
            buyBook.setTitle(nameTitleBuyButton, for: .normal)
            buyBook.addTarget(self, action: #selector(actionBuyButton), for: .touchUpInside)
            
        }
        
        imageBookmarks.setImage(UIImage(systemName:nameIconBookmarks), for: .normal)
        imageBookmarks.backgroundColor = .white
        imageBookmarks.tintColor = .systemGray5
        imageBookmarks.addTarget(self, action: #selector(actionFavorites), for: .touchUpInside)

    }
    
    private func setupImageViews() {
        
        guard let url = URL(string: viewModel.booksResponses?.volumeInfo.imageLinks?.smallThumbnail ?? "") else {
           return
       }
        imageBook.load(url: url)
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        imageBook.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: paddingTopImage).isActive = true
        imageBook.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: paddingLeading).isActive = true
        
        let sizeWidth = viewModel.sizeScreen == .iphone ? widthImageIphoneDetail : widthImageIpadDetail
        imageBook.widthAnchor.constraint(equalToConstant: self.view.bounds.width / sizeWidth).isActive = true
        imageBook.heightAnchor.constraint(equalToConstant: heightImageDetail).isActive = true
        
        titleBook.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: paddingTopLabels).isActive = true
        titleBook.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: paddingTrailing).isActive = true
        titleBook.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: paddingLeading).isActive = true
        
        authorsBook.topAnchor.constraint(equalTo: self.titleBook.bottomAnchor, constant: paddingEmpty).isActive = true
        authorsBook.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: paddingTrailing).isActive = true
        authorsBook.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: paddingLeading).isActive = true
        
        publisherTitle.topAnchor.constraint(equalTo: self.authorsBook.bottomAnchor, constant: paddingTopLabels).isActive = true
        publisherTitle.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: paddingLeading).isActive = true
        
        publisherBook.topAnchor.constraint(equalTo: self.publisherTitle.bottomAnchor, constant: paddingEmpty).isActive = true
        publisherBook.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: paddingLeading).isActive = true
        
        dateTitle.topAnchor.constraint(equalTo: self.authorsBook.bottomAnchor, constant: paddingTopLabels).isActive = true
        dateTitle.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: paddingTrailing).isActive = true
        dateTitle.widthAnchor.constraint(equalToConstant: widthDateLabel).isActive = true
        
        dateBook.topAnchor.constraint(equalTo: self.dateTitle.bottomAnchor, constant: paddingEmpty).isActive = true
        dateBook.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: paddingTrailing).isActive = true
        
        reviewTitle.topAnchor.constraint(equalTo: self.imageBook.bottomAnchor, constant: paddingTopReview).isActive = true
        reviewTitle.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: paddingLeading).isActive = true
        reviewTitle.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: paddingTrailing).isActive = true
        
        priceTitle.topAnchor.constraint(equalTo: self.publisherBook.bottomAnchor, constant: paddingTopLabels).isActive = true
        priceTitle.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: paddingLeading).isActive = true
        
        priceBook.topAnchor.constraint(equalTo: self.priceTitle.bottomAnchor, constant: paddingEmpty).isActive = true
        priceBook.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: paddingLeading).isActive = true
        
        ratingTitle.topAnchor.constraint(equalTo: self.publisherBook.bottomAnchor, constant: paddingTopLabels).isActive = true
        ratingTitle.leadingAnchor.constraint(equalTo: priceTitle.trailingAnchor, constant: paddingLeadingRating).isActive = true
        
        ratingBook.topAnchor.constraint(equalTo: self.ratingTitle.bottomAnchor, constant: paddingEmpty).isActive = true
        ratingBook.leadingAnchor.constraint(equalTo: priceBook.trailingAnchor, constant: paddingLeadingRating).isActive = true
        
        imageBookmarks.topAnchor.constraint(equalTo: self.dateBook.topAnchor, constant: paddingTopLabels).isActive = true
        imageBookmarks.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: paddingTrailing).isActive = true
        imageBookmarks.widthAnchor.constraint(equalToConstant: widthDateLabel).isActive = true
        imageBookmarks.heightAnchor.constraint(equalToConstant: widthDateLabel).isActive = true
        
        buyBook.topAnchor.constraint(equalTo: self.priceBook.bottomAnchor, constant: paddingTopLabels).isActive = true
        buyBook.leadingAnchor.constraint(equalTo: imageBook.safeAreaLayoutGuide.trailingAnchor, constant: paddingLeading).isActive = true
        buyBook.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: paddingTrailing).isActive = true
        
        scrollView.topAnchor.constraint(equalTo: self.reviewTitle.safeAreaLayoutGuide.topAnchor, constant: paddingTopScrollView).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: paddingLeading).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: paddingTrailing).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: heightScrollViewMultiplier).isActive = true
        
        descriptionBook.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: paddingTopLabels).isActive = true
        descriptionBook.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: paddingEmpty).isActive = true
        descriptionBook.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: paddingEmpty).isActive = true
        descriptionBook.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: paddingEmpty).isActive = true
        descriptionBook.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: paddingEmpty).isActive = true
        
    }
    
    @objc private func actionBuyButton(_ sender: UIButton) {
        if let url = URL(string: viewModel.booksResponses?.saleInfo.buyLink ?? ""), !url.absoluteString.isEmpty {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc private func actionFavorites(_ sender: UIButton) {
        imageBookmarks.tintColor = viewModel.tapFavorite(value: !(viewModel.booksResponses?.favorite ?? false))
    }
    
    @objc private func actionGoFavorite(_ sender: UIButton) {
        viewModel.tapListFavorite()
    }
}
