//
//  MockAnalyticsService.swift
//  RetailAppTests
//
//  Created by Anand Nimje on 01/02/25.
//

@testable import RetailApp

class MockAnalyticsService: AnalyticsServiceProtocol {
    var trackedEvent: String?
    
    func trackEvent(_ event: String) {
        trackedEvent = event
    }
}
