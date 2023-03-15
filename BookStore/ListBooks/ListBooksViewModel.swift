//
//  ListBooksViewModel.swift
//  BookStore
//
//  Created by Arthur Borges Conforti on 13/03/23.
//

import Foundation
import Alamofire

protocol ListBooksViewModelCoordinatorDelegate: AnyObject {
    func goBookDetail(books: [BooksReponses.Book], item: String)
    func goBooksFavoritesList(itens: [BooksReponses.Book])
}

protocol ListBooksViewModelProtocol {
    var coordinatorDelegate : ListBooksViewModelCoordinatorDelegate?{get set}
    var updateListSections: Bindable<Bool> { get set }
    var typeList: typeListBooks { get set }
    var favoritesBooks: [BooksReponses.Book] { get set }
}

class ListBooksViewModel: ListBooksViewModelProtocol {
    weak var coordinatorDelegate: ListBooksViewModelCoordinatorDelegate?
    var updateListSections: Bindable<Bool> = Bindable(false)
    var typeList: typeListBooks = .listBook
    var booksList: [BooksReponses.Book] = []
    var favoritesBooks: [BooksReponses.Book] = []
    var startIndexList = "0"
    var countFavoriteList: Int = .zero
    
    
    init(listType: typeListBooks) {
        typeList = listType
    }
    
    func getBooks() {
        switch typeList {
        case .listBook:
            fetchListBook()
        case .favoriteBook:
            fetchFavoriteList()
        }
    }
    
    func fetchListBook() {
        let url = "\(urlRequestList)\(startIndexList)"
        let request = AF.request(url)
         request.responseDecodable(of: BooksReponses.self) { (response) in
           guard let books = response.value else { return }
           for item in books.items {
               self.booksList.append(item)
           }
             self.updateListBindable()
         }
    }
    
    func fetchFavoriteList() {
        if !favoritesBooks.isEmpty {
            self.booksList = favoritesBooks
        }
        self.typeList = .listBook
        self.updateListBindable()
    }
    
    func updateListBindable() {
        self.updateListSections.value = true
    }
    
    func tapFavorite() {
        coordinatorDelegate?.goBooksFavoritesList(itens: favoritesBooks)
    }

    
    func tapBookDetail(item: String) {
        coordinatorDelegate?.goBookDetail(books: booksList, item: item)
    }
}
