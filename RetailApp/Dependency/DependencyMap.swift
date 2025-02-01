//
//  DependencyMap.swift
//  RetailApp
//
//  Created by Anand Nimje on 01/02/25.
//

import Swinject

struct DependencyMap {
    static func registerDependencies(in container: Container) {
        // Register Networking
        container.register(NetworkServiceProtocol.self) { _ in
            NetworkService()
        }

        // Register Analytics
        container.register(AnalyticsServiceProtocol.self) { _ in
            AnalyticsService()
        }

        // Register Utility
        container.register(LoggerProtocol.self) { _ in
            Logger()
        }

        // Register Cart
        container.register(CartService.self) { _ in
            CartManager()
        }
        
        container.register(ProductDetailCoordinator.self) { (r, product: Product) in
            ProductDetailCoordinator(
                product: product,
                resolver: r
            )
        }
    }
}
