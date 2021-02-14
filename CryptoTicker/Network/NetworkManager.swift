//
//  NetworkManager.swift
//  CryptoTicker
//
//  Created by Yusuf Demirci on 13.02.21.
//

import RxSwift

protocol NetworkManagerDelegate {
    func sendRequest<T: Codable>(request: Request) -> Observable<T>
}

class NetworkManager: NetworkManagerDelegate {

    static let shared = NetworkManager()

    func sendRequest<T: Codable>(request: Request) -> Observable<T> {
        Observable.create { observer in
            let data = try! Data(contentsOf:
                                    URL(fileURLWithPath: Bundle.main.path(forResource: "success-response", ofType: "json")!),
                                 options: NSData.ReadingOptions.mappedIfSafe)

            do {
                let response = try JSONDecoder().decode(Response<T>.self, from: data)

                if let data = response.data {
                    observer.onNext(data)
                } else if let error = response.error {
                    observer.onError(error)
                } else {
                    observer.onError(NetworkError.init(message: .responseCouldNotParse))
                }
            } catch {
                observer.onError(NetworkError.init(message: .responseCouldNotParse))
            }

            observer.onCompleted()

            return Disposables.create {}
        }
    }
}
