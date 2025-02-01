//
//  ProductDetailCoordinator.swift
//  RetailApp
//
//  Created by Anand Nimje on 01/02/25.
//

import SwiftUI
import Swinject

final class ProductDetailCoordinator: Coordinator {
    private let product: Product
    private let resolver: Resolver

    init(product: Product, resolver: Resolver) {
        self.product = product
        self.resolver = resolver
    }

    func start() -> AnyView {
        let cartManager = resolver.resolve(CartService.self)!
        let analyticsService = resolver.resolve(AnalyticsServiceProtocol.self)!
        let networkService = resolver.resolve(NetworkServiceProtocol.self)!

        let viewModel = ProductDetailViewModel(
            product: product,
            cartManager: cartManager,
            analyticsService: analyticsService,
            networkService: networkService
        )
        return AnyView(
            ProductDetailView(viewModel: viewModel)
        )
    }
}
