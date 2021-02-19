//
//  NetworkError.swift
//  CryptoTicker
//
//  Created by Yusuf Demirci on 14.02.21.
//

import Foundation

struct NetworkError: Error, Codable {

    let message: NetworkErrorMessage

    var localizedDescription: String {
        NSLocalizedString("\(message)", comment: "")
    }
}

enum NetworkErrorMessage: String, Codable {
    case invalidResponse
    case responseCouldNotParse
}
