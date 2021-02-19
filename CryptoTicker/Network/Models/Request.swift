//
//  Request.swift
//  CryptoTicker
//
//  Created by Yusuf Demirci on 13.02.21.
//

import Alamofire

protocol RequestDelegate {
    var base: String { get }
    var endpoint: String { get }

    func path() -> String
    func method() -> HTTPMethod
    func parameters() -> Parameters
    func headers() -> HTTPHeaders
}

class Request: RequestDelegate {

    var base: String = "https://api.binance.com/api/v3"

    var endpoint: String {
        base + path()
    }

    func path() -> String { "" }
    func method() -> HTTPMethod { .get }
    func parameters() -> Parameters { [:] }
    func headers() -> HTTPHeaders { [:] }
}
