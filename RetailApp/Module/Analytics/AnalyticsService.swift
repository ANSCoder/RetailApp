//
//  AnalyticsService.swift
//  RetailApp
//
//  Created by Anand Nimje on 01/02/25.
//

final class AnalyticsService: AnalyticsServiceProtocol {
    func trackEvent(_ event: String) {
        print("Tracked event: \(event)")
    }
}
