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
    
    func sendRequest<T: Codable>(request: CryptoTicker.Request) -> Observable<T> {
        Observable.create { observer in
            guard let path = Bundle(for: MockNetworkManager.self)
                    .path(forResource: request.testResponseFile, ofType: "json") else {
                observer.onError(NetworkError.init(message: .invalidTestFile))
                observer.onCompleted()
                return Disposables.create {}
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let response = try JSONDecoder().decode(T.self, from: data)
                observer.onNext(response)
            } catch {
                observer.onError(NetworkError.init(message: .responseCouldNotParse))
            }
            
            observer.onCompleted()
            
            return Disposables.create {}
        }
    }
}
