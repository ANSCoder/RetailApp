//
//  MockNetworkService.swift
//  RetailAppTests
//
//  Created by Anand Nimje on 01/02/25.
//

import Foundation
@testable import RetailApp

class MockNetworkService: NetworkServiceProtocol {
    var dataToReturn: Data?
    var fetchCalled = false

    func fetchProducts() async -> [Product] {
        fetchCalled = true
        guard let data = dataToReturn else { return [] }
        // Decode mock data if provided
        if let products = try? JSONDecoder().decode([Product].self, from: data) {
            return products
        }
        return []
    }
}
