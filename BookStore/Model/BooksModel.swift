//
//  BooksModel.swift
//  BookStore
//
//  Created by Arthur Borges Conforti on 13/03/23.
//

import Foundation

struct BooksReponses: Decodable {
    var items: [Book]
    
    struct Book: Decodable, Identifiable {
        var id: String
        var volumeInfo: VolumeInfo
        var saleInfo: SaleInfo
        
        struct VolumeInfo: Decodable {
            var title: String
            var authors: [String]?
            var publisher: String?
            var publishedDate: String?
            var description: String?
            var imageLinks: ImageLinks?
            
            struct ImageLinks: Decodable {
                var smallThumbnail: String?
                var thumbnail: String?
            }
        }
        
        struct SaleInfo: Decodable {
            var saleability: String?
            var listPrice: ListPrice?
            var buyLink: String?
            
            struct ListPrice: Decodable {
                var amount: Double?
            }
        }
    }
}
