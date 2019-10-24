//
//  CardsListViewModel.swift
//  PatternsExampleMVC
//
//  Created by Yury Popov on 24.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import Foundation

class CardsListViewModel: CardsListViewModelProtocol {
    
    var cards: [Card] = []
    
    func fetchCards(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { cards in
            self.cards = cards
            completion()
        }
    }
    
    func numberOfRows() -> Int? {
        return cards.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CardsTableViewCellViewModelProtocol? {
        let card = cards[indexPath.row]
        return CardsTableViewCellViewModel(card: card)
    }
    
    
}
