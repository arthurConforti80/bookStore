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
    var updateListSections: Bindable<Bool> { get set }
    var booksList: [BooksReponses.Book] { get set }
    var itemSelected: String {get set}
}

class DetailBooksViewModel: DetailBooksViewModelProtocol {
    
    weak var coordinatorDelegate: DetailBooksViewModelCoordinatorDelegate?
    var updateListSections: Bindable<Bool> = Bindable(false)
    var booksResponses: BooksReponses.Book?
    var booksList: [BooksReponses.Book] = []
    var itemSelected: String = ""

    init(item: [BooksReponses.Book], selectedItem: String) {
        self.booksList = item
        self.itemSelected = selectedItem
        self.getSelectedBook()
    }
    
    func getSelectedBook() {
        for item in booksList {
            if item.id == itemSelected {
                booksResponses = item
            }
        }
    }
    
    func tapFavorite(value: Bool) -> UIColor {
        updateFavorite(value: value)
        return value == true ? .red : .systemGray5
    }
    
    func updateFavorite(value: Bool) {
        for i in 1...booksList.count {
            let index = i - 1
            if booksList[index].id == booksResponses?.id {
                booksList[index].favorite = value
            }
        }
    }
    
    func tapListFavorite() {
       
        var favoriteList: [BooksReponses.Book] = []
        for item in booksList {
            if item.favorite == true {
                favoriteList.append(item)
            }
        }
       coordinatorDelegate?.goBooksFavorites(itens: favoriteList)
    }
}
