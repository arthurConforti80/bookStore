//
//  ListBooksViewModel.swift
//  BookStore
//
//  Created by Arthur Borges Conforti on 13/03/23.
//

import Foundation
import Alamofire

protocol ListBooksViewModelCoordinatorDelegate: AnyObject {
    func goBookDetail(item: BooksReponses.Book)
}

protocol ListBooksViewModelProtocol {
    var coordinatorDelegate : ListBooksViewModelCoordinatorDelegate?{get set}
    var updateListSections: Bindable<Bool> { get set }
    var typeList: typeListBooks { get set }
    var booksList: [BooksReponses.Book] { get set }
}

class ListBooksViewModel: ListBooksViewModelProtocol {
    weak var coordinatorDelegate: ListBooksViewModelCoordinatorDelegate?
    var updateListSections: Bindable<Bool> = Bindable(false)
    var typeList: typeListBooks = .listBook
    var booksList: [BooksReponses.Book] = []
    
    init(listType: typeListBooks) {
        typeList = listType
    }
    
    func getBooks() {
        switch typeList {
        case .listBook:
            fetchListBook()
        case .favoriteBook:
            updateListBindable()
        }
    }
    
    func fetchListBook() {
        let headers : HTTPHeaders = ["Content-Type": "application/json", "client": "ios"]
        let urlRequest = "https://www.googleapis.com/books/v1/volumes?q=ios&maxResults=20&startIndex=0"
        let request = AF.request(urlRequest, headers: headers)
         request.responseDecodable(of: BooksReponses.self) { (response) in
           guard let books = response.value else { return }
           for item in books.items {
               self.booksList.append(item)
           }
             self.updateListBindable()
         }
    }
    
    func updateListBindable() {
        self.updateListSections.value = true
    }
    
    func tapBookDetail(item: BooksReponses.Book) {
        coordinatorDelegate?.goBookDetail(item: item)
    }
}
