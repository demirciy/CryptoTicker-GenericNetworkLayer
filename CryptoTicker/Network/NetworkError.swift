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
        NSLocalizedString("Error.Network.\(message)", comment: "")
    }

    init(message: NetworkErrorMessage) {
        self.message = message
    }

    init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)

        message = (try? keyedContainer.decode(NetworkErrorMessage.self, forKey: .message)) ?? .errorMessageNotFound
    }
}

enum NetworkErrorMessage: String, Codable {
    case general = "GENERAL"
    case responseCouldNotParse = "RESPONSE_COULD_NOT_PARSE"
    case errorMessageNotFound = "ERROR_MESSAGE_NOT_FOUND"
    case coinNotFound = "COIN_NOT_FOUND"
}
