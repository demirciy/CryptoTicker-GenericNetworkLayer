//
//  Request.swift
//  CryptoTicker
//
//  Created by Yusuf Demirci on 13.02.21.
//

import Alamofire

protocol RequestDelegate {
    var base: String { get }
    var path: String { get }
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters { get }
    var headers: HTTPHeaders { get }
    var testResponseFile: String { get set }
}

class Request: RequestDelegate {

    var base: String = "https://api.binance.com/api/v3"
    var path: String { "" }
    var endpoint: String {
        base + path
    }
    var method: HTTPMethod { .get }
    var parameters: Parameters { [:] }
    var headers: HTTPHeaders { [:] }
    var testResponseFile: String = ""
}
