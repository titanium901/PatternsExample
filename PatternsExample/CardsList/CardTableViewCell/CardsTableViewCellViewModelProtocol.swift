//
//  CardsTableViewCellViewModelProtocol.swift
//  PatternsExampleMVC
//
//  Created by Yury Popov on 24.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import Foundation

protocol CardsTableViewCellViewModelProtocol {
    var cardsValue: String? { get }
    var imageData: Data? { get }
    init(card: Card)
}
