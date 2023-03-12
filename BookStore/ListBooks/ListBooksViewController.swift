//
//  ListBooksViewController.swift
//  BookStore
//
//  Created by Arthur Borges Conforti on 12/03/23.
//

import Foundation
import UIKit

class ListBooksViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "BookStore"
        titleLabel.text = "BookStore"
        titleLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        print("Opaaa to aqui!!!!!")
        // Do any additional setup after loading the view.
    }
    
}
