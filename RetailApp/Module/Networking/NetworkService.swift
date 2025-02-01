//
//  NetworkService.swift
//  RetailApp
//
//  Created by Anand Nimje on 01/02/25.
//

final class NetworkService: NetworkServiceProtocol {
    func fetchProducts() async -> [Product] {
        // Simulate a network request delay
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return [Product(id: 1, name: "iPhone"), Product(id: 2, name: "MacBook")]
    }
}
