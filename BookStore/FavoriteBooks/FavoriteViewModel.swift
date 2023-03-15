//
//  FavoriteViewModel.swift
//  BookStore
//
//  Created by Arthur Borges Conforti on 14/03/23.
//

import Foundation
import Alamofire

protocol FavoriteBooksViewModelCoordinatorDelegate: AnyObject {
    func goBookDetail(books: [BooksReponses.Book], item: String)
    func goHome(itens: [BooksReponses.Book])
}

protocol FavoriteBooksViewModelProtocol {
    var coordinatorDelegate : FavoriteBooksViewModelCoordinatorDelegate?{get set}
    var updateListSections: Bindable<Bool> { get set }
    var typeList: typeListBooks { get set }
    var favoritesBooks: [BooksReponses.Book] { get set }
}

class FavoriteBooksViewModel: FavoriteBooksViewModelProtocol {
    weak var coordinatorDelegate: FavoriteBooksViewModelCoordinatorDelegate?
    var updateListSections: Bindable<Bool> = Bindable(false)
    var typeList: typeListBooks = .listBook
    var booksList: [BooksReponses.Book] = []
    var favoritesBooks: [BooksReponses.Book] = []
    var startIndexList = "0"
    var countFavoriteList: Int = .zero

    func fetchFavoriteList() {
        for item in favoritesBooks {
            if item.favorite == true {
                self.booksList.append(item)
            }
        }
        self.updateListBindable()
    }
    
    func updateListBindable() {
        self.updateListSections.value = true
    }
    
    func tapHoHome() {
        coordinatorDelegate?.goHome(itens: favoritesBooks)
    }

    func tapBookDetail(item: String) {
        coordinatorDelegate?.goBookDetail(books: booksList, item: item)
    }
}

