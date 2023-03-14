//
//  MainCoordinator.swift
//  BookStore
//
//  Created by Arthur Borges Conforti on 12/03/23.
//

import Foundation
import UIKit

struct CoordinatorStack<Element> {
    var items = [Element]() {
        didSet {
            #if !PROD
            #endif
        }
    }
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() {
        if !items.isEmpty {
            items.removeLast()
        }
    }
    
    mutating func clear() {
        if !items.isEmpty {
            items.removeAll()
        }
    }
}

public class MainCoordinator: NSObject, UINavigationControllerDelegate {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    public func start() {
        navigationController.delegate = self
        HomeController()
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
    }
    
    private func HomeController() {
        let vc = ListBooksViewController()
        let viewModel = ListBooksViewModel.init(listType: .listBook)
        viewModel.coordinatorDelegate = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: false)
    }
    
    private func BookDetailController(book: [BooksReponses.Book], selectedItem: String) {
        let detail = DetailBookViewController()
        let viewModel = DetailBooksViewModel.init(item: book, selectedItem: selectedItem)
        viewModel.coordinatorDelegate = self
        detail.viewModel = viewModel
        navigationController.pushViewController(detail, animated: false)
       
    }
    
    private func FavoriteController(list: [BooksReponses.Book]) {
        let vc = ListBooksViewController()
        let viewModel = ListBooksViewModel.init(listType: .favoriteBook)
        viewModel.coordinatorDelegate = self
        viewModel.booksList = list
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: false)
    }
  
}

extension MainCoordinator: ListBooksViewModelCoordinatorDelegate {
    func goBookDetail(books: [BooksReponses.Book], item: String) {
        BookDetailController(book: books, selectedItem: item)
    }
}

extension MainCoordinator: DetailBooksViewModelCoordinatorDelegate {
    func goBooksFavorites(itens: [BooksReponses.Book]) {
        FavoriteController(list: itens)
    }
}



