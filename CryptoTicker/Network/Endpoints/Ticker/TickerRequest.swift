//
//  TickerRequest.swift
//  CryptoTicker
//
//  Created by Yusuf Demirci on 14.02.21.
//

import Foundation

class TickerRequest: Request {

    override var path: String {
        "/ticker/24hr"
    }
}
