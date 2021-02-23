//
//  NetworkManager.swift
//  CryptoTicker
//
//  Created by Yusuf Demirci on 13.02.21.
//

import Alamofire
import RxSwift

protocol NetworkManagerDelegate {
    func sendRequest<T: Codable>(request: Request) -> Single<T>
}

class NetworkManager: NetworkManagerDelegate {
    
    func sendRequest<T: Codable>(request: Request) -> Single<T> {
        Single<T>.create { single in
            AF.request(request.endpoint,
                       method: request.method,
                       parameters: request.parameters,
                       headers: request.headers)
                .responseData { data in
                    guard let data = data.data else {
                        single(.error(NetworkError.init(message: .invalidResponse)))
                        return
                    }
                    
                    do {
                        let response = try JSONDecoder().decode(T.self, from: data)
                        single(.success(response))
                    } catch {
                        single(.error(NetworkError.init(message: .responseCouldNotParse)))
                    }
                }
            
            return Disposables.create()
        }
    }
}
