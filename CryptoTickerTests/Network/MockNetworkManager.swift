//
//  MockNetworkManager.swift
//  CryptoTickerTests
//
//  Created by Yusuf Demirci on 20.02.21.
//

import Alamofire
import RxSwift

@testable import CryptoTicker

class MockNetworkManager: NetworkManagerDelegate {
    
    func sendRequest<T: Codable>(request: CryptoTicker.Request) -> Single<T> {
        Single<T>.create { single in
            guard let path = Bundle(for: MockNetworkManager.self)
                    .path(forResource: request.testResponseFile, ofType: "json") else {
                single(.error(NetworkError.init(message: .invalidResponse)))
                return Disposables.create {}
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let response = try JSONDecoder().decode(T.self, from: data)
                single(.success(response))
            } catch {
                single(.error(NetworkError.init(message: .responseCouldNotParse)))
            }
            
            return Disposables.create {}
        }
    }
}
