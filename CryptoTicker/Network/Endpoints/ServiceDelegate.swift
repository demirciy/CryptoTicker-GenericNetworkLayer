//
//  ServiceDelegate.swift
//  CryptoTicker
//
//  Created by Yusuf Demirci on 21.02.21.
//

import Foundation

protocol ServiceDelegate: class {
    var networkManager: NetworkManagerDelegate { get }
}
