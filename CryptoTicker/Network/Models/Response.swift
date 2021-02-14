//
//  Response.swift
//  CryptoTicker
//
//  Created by Yusuf Demirci on 13.02.21.
//

import Foundation

struct Response<T: Codable>: Codable {

    let data: T?
    let error: NetworkError?

    init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)

        data = try? keyedContainer.decode(T.self, forKey: .data)
        error = try? keyedContainer.decode(NetworkError.self, forKey: .error)
    }
}
