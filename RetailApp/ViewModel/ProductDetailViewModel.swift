//
//  ProductDetailViewModel.swift
//  RetailApp
//
//  Created by Anand Nimje on 01/02/25.
//

import Foundation

final class ProductDetailViewModel: ObservableObject {
    @Published var product: Product
    private let cartManager: CartService
    private let analyticsService: AnalyticsServiceProtocol
    private let networkService: NetworkServiceProtocol
    
    init(product: Product, cartManager: CartService, analyticsService: AnalyticsServiceProtocol, networkService: NetworkServiceProtocol) {
        self.product = product
        self.cartManager = cartManager
        self.analyticsService = analyticsService
        self.networkService = networkService
    }
    
    func addToCart() {
        cartManager.addProduct(product)
        analyticsService.trackEvent("Added \(product.name) to cart")
    }
    
    func fetchProductDetails() async {
        let products = await networkService.fetchProducts()
        print("Fetched products: \(products)")
    }
}
