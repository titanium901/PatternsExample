//
//  CardsListViewModelProtocol.swift
//  PatternsExampleMVC
//
//  Created by Yury Popov on 24.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import Foundation

protocol CardsListViewModelProtocol {
    var cards: [Card] { get }
    func fetchCards(completion: @escaping() -> Void)
    func numberOfRows() -> Int?
    func cellViewModel(for indexPath: IndexPath) -> CardsTableViewCellViewModelProtocol?
}
