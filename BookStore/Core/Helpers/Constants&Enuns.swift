//
//  Constants&Enuns.swift
//  BookStore
//
//  Created by Arthur Borges Conforti on 13/03/23.
//

import Foundation

public enum saleabilitySale: String {
    case forSale = "FOR_SALE"
    case notForSale = "NOT_FOR_SALE"
}

public enum typeListBooks {
    case listBook
    case favoriteBook
}

public enum typeScreen {
    case iphone
    case ipad
}

public var urlRequestList = "https://www.googleapis.com/books/v1/volumes?q=ios&maxResults=20&startIndex="

// ListBooksViewController
let nameAPP = "Books Store"
let subtitleApp = "Search: iOS Catalog"
let nameCellList = "Cell"
let labelDate = "Date"
let sizeTitleLabel: CGFloat = 14.0
let numberStartIndex = 20
let widthCellCollectionView: CGFloat = 2.1
let heightCellCollectionView: CGFloat = 2
let lessRow = 1

// ListBookViewCell
let borderCell: CGFloat = 1
let cornerRadiusCell: CGFloat = 4
let sizeTitleFont: CGFloat = 13.0
let numberLinesTitle = 2
let numberLines = 0
let sizePublisherFont = 11.0
let sizeDateBookFont = 12.0
let sizeForSaleFont = 13.0
let paddingTopImage: CGFloat = 30
let widthImage: CGFloat = 2.5
let heightImage: CGFloat = 2
let paddingTopCell: CGFloat = 10
let paddingTrailingCell: CGFloat = -10
let paddingLeadingCell: CGFloat = 10
let paddingBottonCell: CGFloat = -10
let forSaleText = "Avalilable"
let NotForSaleText = "Not Avalilable"

//DetailViewController
let nameScreen = "Details Books"
let leftLabel = "Back"
let rightLabel = "Favorites"
let sizeTitleBook = 18.0
let sizeAuthorsBook = 10.0
let sizePublisherTitle = 14.0
let sizePublisherData = 12.0
let sizeDateTitle = 14.0
let sizeDateData = 12.0
let sizePriceTitle = 18.0
let sizePriceData = 16.0
let sizeRatingTitle = 18.0
let sizeRatingData = 16.0
let sizeReviewTitle = 16.0
let sizeDescriptionData = 12.0
let namePublisherLabel = "Publisher: "
let nameDateTitle = "Date: "
let namePriceTitle = "Price: "
let nameRatingTitle = "Rating: "
let nameReviewTitle = "Review: "
let nameTitleBuyButton = "Buy Now!"
let nameIconBookmarks = "heart.fill"
let widthImageIphoneDetail: CGFloat = 2.5
let widthImageIpadDetail: CGFloat = 5
let heightImageDetail: CGFloat = 168
let paddingTopLabels: CGFloat = 10
let widthDateLabel: CGFloat = 70
let paddingTopReview: CGFloat = 50
let paddingLeadingDate: CGFloat = 20
let paddingLeadingRating: CGFloat = 20
let paddingTopScrollView: CGFloat = 20
let heightScrollViewMultiplier: CGFloat = 0.5
let paddingDateTitle: CGFloat = 52
let paddingTopIconBook: CGFloat = 20
let paddingLeadingIconBook: CGFloat = 30
let widthIconBook: CGFloat = 50
let heightIconBook: CGFloat = 50

// Common
let paddingEmpty: CGFloat  = 0
let paddingTop: CGFloat  = 10
let paddingTrailing: CGFloat  = -10
let paddingLeading: CGFloat  = 10
let minScreenIpad: CGFloat = 600

