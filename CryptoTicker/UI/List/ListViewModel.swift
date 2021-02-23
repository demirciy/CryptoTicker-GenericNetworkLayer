//
//  ListViewModel.swift
//  CryptoTicker
//
//  Created by Yusuf Demirci on 08.02.21.
//

import RxCocoa
import RxSwift

class ListViewModel {

    // MARK: Properties

    let coins: BehaviorRelay<[Coin]> = .init(value: [])

    private let disposeBag: DisposeBag = .init()

    func refreshCoins() {
        TickerService().hr24().subscribe { response in
            self.coins.accept(response)
        } onError: { error in
            print(error.localizedDescription)
        }
        .disposed(by: disposeBag)
    }

    func search(_ text: String?) {
        TickerService().hr24().subscribe { response in
            guard let text = text, !text.isEmpty else {
                self.coins.accept(response)
                return
            }
            self.coins.accept(response.filter { $0.symbol.lowercased().contains(text.lowercased()) })
        } onError: { error in
            print(error.localizedDescription)
        }
        .disposed(by: disposeBag)
    }
}
