//
//  ListViewModel.swift
//  CryptoTicker
//
//  Created by Yusuf Demirci on 08.02.21.
//

import RxSwift

class ListViewModel {

    // MARK: Properties

    var coins: PublishSubject<[Coin]> = .init()

    private let disposeBag: DisposeBag = .init()

    func refreshCoins() {
        TickerService().hr24().subscribe(onNext: { response in
            self.coins.onNext(response)
        }, onError: { error in
            print(error.localizedDescription)
        })
        .disposed(by: disposeBag)
    }

    func search(_ text: String?) {
        TickerService().hr24().subscribe(onNext: { response in
            if let text = text, !text.isEmpty {
                self.coins.onNext(response.filter { $0.symbol.lowercased().contains(text.lowercased()) })
            } else {
                self.coins.onNext(response)
            }
        }, onError: { error in
            print(error.localizedDescription)
        })
        .disposed(by: disposeBag)
    }
}
