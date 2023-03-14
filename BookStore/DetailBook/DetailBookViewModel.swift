//
//  DetailBookViewModel.swift
//  BookStore
//
//  Created by Arthur Borges Conforti on 13/03/23.
//

import Foundation
import UIKit

protocol DetailBooksViewModelCoordinatorDelegate: AnyObject {
    func goBooksFavorites(itens: [BooksReponses.Book])
}

protocol DetailBooksViewModelProtocol {
    var coordinatorDelegate : DetailBooksViewModelCoordinatorDelegate?{get set}
    var booksResponses: BooksReponses.Book{get set}
    var updateListSections: Bindable<Bool> { get set }
}

class DetailBooksViewModel: DetailBooksViewModelProtocol {
    
    weak var coordinatorDelegate: DetailBooksViewModelCoordinatorDelegate?
    var updateListSections: Bindable<Bool> = Bindable(false)
    var booksResponses: BooksReponses.Book
    var booksFavorites: [BooksReponses.Book] = []
    var defaultColorFavorite = UIColor.systemGray5

    init(item: BooksReponses.Book) {
        booksResponses = item
    }
    
    func tapFavorite(value: Bool) -> UIColor {
        self.booksResponses.favorite = value
        if value {
            booksFavorites.append(booksResponses)
            return .red
        } else {
            removeFavorite()
        }
        return defaultColorFavorite
    }
    
    func removeFavorite() {
        for i in 1...booksFavorites.count {
            let index = i - 1
            if booksFavorites[index].id == booksResponses.id {
                booksFavorites.remove(at: index)
            }
        }
    }
    
    func tapListFavorite() {
        coordinatorDelegate?.goBooksFavorites(itens: booksFavorites)
    }
}
