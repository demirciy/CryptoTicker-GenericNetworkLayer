//
//  NetworkManager.swift
//  CryptoTicker
//
//  Created by Yusuf Demirci on 13.02.21.
//

import Alamofire
import RxSwift

protocol NetworkManagerDelegate {
    func sendRequest<T: Codable>(request: Request) -> Observable<T>
}

class NetworkManager: NetworkManagerDelegate {

    func sendRequest<T: Codable>(request: Request) -> Observable<T> {
        Observable.create { observer in
            AF.request(request.endpoint,
                       method: request.method(),
                       parameters: request.parameters(),
                       headers: request.headers())
                .responseData { data in
                    guard let data = data.data else {
                        observer.onError(NetworkError.init(message: .invalidResponse))
                        observer.onCompleted()
                        return
                    }

                    do {
                        let response = try JSONDecoder().decode(T.self, from: data)
                        observer.onNext(response)
                    } catch {
                        observer.onError(NetworkError.init(message: .responseCouldNotParse))
                    }

                    observer.onCompleted()
                }

            return Disposables.create {}
        }
    }
}
