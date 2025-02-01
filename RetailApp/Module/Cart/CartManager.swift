//
//  CartManager.swift
//  RetailApp
//
//  Created by Anand Nimje on 01/02/25.
//

final class CartManager: CartService {
    private(set) var items: [Product] = []
    private(set) var addedProduct: Product? = nil
    
    func addProduct(_ product: Product) {
        items.append(product)
        addedProduct = product
    }
}
