//
//  ProductDetailViewModelTests.swift
//  RetailAppTests
//
//  Created by Anand Nimje on 01/02/25.
//

import XCTest
@testable import RetailApp

class ProductDetailViewModelTests: XCTestCase {
    var mockCartManager: MockCartManager!
    var mockAnalyticsService: MockAnalyticsService!
    var mockNetworkService: MockNetworkService!
    var product: Product!
    var viewModel: ProductDetailViewModel!

    override func setUpWithError() throws {
        // Initialize mocks and test subject
        mockCartManager = MockCartManager()
        mockAnalyticsService = MockAnalyticsService()
        mockNetworkService = MockNetworkService()
        product = Product(id: 1, name: "iPhone")
        viewModel = ProductDetailViewModel(
            product: product,
            cartManager: mockCartManager,
            analyticsService: mockAnalyticsService,
            networkService: mockNetworkService
        )
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Clean up after each test
        mockCartManager = nil
        mockAnalyticsService = nil
        product = nil
        viewModel = nil
        try super.tearDownWithError()
    }
   
    func testAddToCart() {
        // Act
        viewModel.addToCart()
        
        // Assert that the product is added and the event is tracked
        XCTAssertEqual(mockCartManager.addedProduct?.name, "iPhone")
        XCTAssertEqual(mockAnalyticsService.trackedEvent, "Added iPhone to cart")
    }
    
    func testAddToCartTwice() {
        viewModel.addToCart()
        viewModel.addToCart()
        
        // Assert that two items are added and tracking is consistent
        XCTAssertEqual(mockCartManager.items.count, 2)
        XCTAssertEqual(mockAnalyticsService.trackedEvent, "Added iPhone to cart")
    }

    func testFetchProductData() async {
        // Setup mock network response
        let mockData = try? JSONEncoder().encode([Product(id: 1, name: "iPhone"), Product(id: 2, name: "MacBook")])
        mockNetworkService.dataToReturn = mockData
        
        // Act
        await viewModel.fetchProductDetails()
        
        // Assert that fetchProducts was called and products were fetched
        XCTAssertTrue(mockNetworkService.fetchCalled)
        XCTAssertEqual(viewModel.product.name, "iPhone")
    }
}
