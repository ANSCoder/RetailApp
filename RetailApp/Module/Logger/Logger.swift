//
//  Logger.swift
//  RetailApp
//
//  Created by Anand Nimje on 01/02/25.
//

final class Logger: LoggerProtocol {
    func log(_ message: String) {
        print("LOG: \(message)")
    }
}
