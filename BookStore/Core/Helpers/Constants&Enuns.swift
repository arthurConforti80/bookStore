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

public var urlRequestList = "https://www.googleapis.com/books/v1/volumes?q=ios&maxResults=20&startIndex="
