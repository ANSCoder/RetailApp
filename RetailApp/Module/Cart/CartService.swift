//
//  CartService.swift
//  RetailApp
//
//  Created by Anand Nimje on 01/02/25.
//

protocol CartService {
    var items: [Product] { get }
    var addedProduct: Product? { get }
    func addProduct(_ product: Product)
}
