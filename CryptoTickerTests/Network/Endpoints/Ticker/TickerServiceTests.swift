//
//  TickerServiceTests.swift
//  CryptoTickerTests
//
//  Created by Yusuf Demirci on 20.02.21.
//

import RxSwift
import XCTest

@testable import CryptoTicker

class TickerServiceTests: XCTestCase {

    private var mockNetworkManager: MockNetworkManager!
    private var tickerService: TickerService!

    private let disposeBag: DisposeBag = .init()

    override func setUpWithError() throws {
        mockNetworkManager = .init()
        tickerService = .init(networkManager: mockNetworkManager)
    }

    override func tearDownWithError() throws {
        mockNetworkManager = nil
        tickerService = nil
    }

    func testHr24Real() {
        let expectation = XCTestExpectation(description: "Succeed")

        TickerService().hr24().subscribe(onNext: { response in
            if !response.isEmpty {
                expectation.fulfill()
            }
        })
        .disposed(by: disposeBag)

        wait(for: [expectation], timeout: 1)
    }

    func testHr24Mock() {
        let expectation = XCTestExpectation(description: "Succeed")

        let request = TickerRequest()
        request.testResponseFile = "Ticker24HrSuccessResponse"

        tickerService.hr24(request: request).subscribe(onNext: { response in
            if !response.isEmpty {
                expectation.fulfill()
            }
        })
        .disposed(by: disposeBag)

        wait(for: [expectation], timeout: 1)
    }
}
