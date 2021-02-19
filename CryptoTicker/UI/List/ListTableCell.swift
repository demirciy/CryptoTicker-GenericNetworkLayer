//
//  ListTableCell.swift
//  CryptoTicker
//
//  Created by Yusuf Demirci on 16.02.21.
//

import UIKit

class ListTableCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: "ListTableCell")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
