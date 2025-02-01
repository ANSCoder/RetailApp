//
//  ContentView.swift
//  RetailApp
//
//  Created by Anand Nimje on 01/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var products: [Product] = []

    var body: some View {
        NavigationView {
            List(products, id: \.id) { product in
                if let coordinator = DIContainer.shared.container.resolve(
                    ProductDetailCoordinator.self,
                    argument: product
                ) {
                    NavigationLink(
                        destination: coordinator.start()
                    ) {
                        Text(product.name)
                    }
                } else {
                    // Fallback UI in case the dependency resolution fails
                    Text("Unable to load product details")
                }
            }
            .navigationTitle("Products")
        }
        .task {
            let networkService = DIContainer.shared.container.resolve(NetworkServiceProtocol.self)
            products = await networkService?.fetchProducts() ?? []
        }
    }
}
