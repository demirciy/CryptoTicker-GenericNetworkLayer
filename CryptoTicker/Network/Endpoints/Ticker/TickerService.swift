//
//  TickerService.swift
//  CryptoTicker
//
//  Created by Yusuf Demirci on 13.02.21.
//

import RxSwift

class TickerService: ServiceDelegate {

    internal let networkManager: NetworkManagerDelegate

    init(networkManager: NetworkManagerDelegate = NetworkManager()) {
        self.networkManager = networkManager
    }

    func hr24(request: TickerRequest = .init()) -> Single<[Coin]> {
        networkManager.sendRequest(request: request)
    }
}
