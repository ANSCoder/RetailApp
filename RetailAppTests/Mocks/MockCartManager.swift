//
//  MockCartManager.swift
//  RetailAppTests
//
//  Created by Anand Nimje on 01/02/25.
//

@testable import RetailApp

class MockCartManager: CartService {
    private(set) var items: [Product] = []
    private(set) var addedProduct: Product? = nil
    
    func addProduct(_ product: Product) {
        items.append(product)
        addedProduct = product
    }
}
