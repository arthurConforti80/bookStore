//
//  DetailBookViewModel.swift
//  BookStore
//
//  Created by Arthur Borges Conforti on 13/03/23.
//

import Foundation

protocol DetailBooksViewModelCoordinatorDelegate: AnyObject {}

protocol DetailBooksViewModelProtocol {
    var coordinatorDelegate : DetailBooksViewModelCoordinatorDelegate?{get set}
    var booksResponses: BooksReponses.Book?{get set}
    var updateListSections: Bindable<Bool> { get set }
}

class DetailBooksViewModel: DetailBooksViewModelProtocol {
    
    weak var coordinatorDelegate: DetailBooksViewModelCoordinatorDelegate?
    var updateListSections: Bindable<Bool> = Bindable(false)
    var booksResponses: BooksReponses.Book?

    init(item: BooksReponses.Book) {
        booksResponses = item
    }
}
