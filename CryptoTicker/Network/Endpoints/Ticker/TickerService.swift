//
//  TickerService.swift
//  CryptoTicker
//
//  Created by Yusuf Demirci on 13.02.21.
//

import RxSwift

class TickerService {

    class func hr24() -> Observable<[Coin]> {
        NetworkManager.shared.sendRequest(request: TickerRequest())
    }
}
