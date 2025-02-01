//
//  NetworkServiceProtocol.swift
//  RetailApp
//
//  Created by Anand Nimje on 01/02/25.
//

protocol NetworkServiceProtocol {
    func fetchProducts() async -> [Product]
}
