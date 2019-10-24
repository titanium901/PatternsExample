//
//  CardsTableViewCellViewModel.swift
//  PatternsExampleMVC
//
//  Created by Yury Popov on 24.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import Foundation

class CardsTableViewCellViewModel: CardsTableViewCellViewModelProtocol {
    
    var cardsValue: String? {
        return card.value
    }
    
    var imageData: Data? {
        return ImageManager.shared.getImageData(from: card.image)
    }
    
    private var card: Card
    
    required init(card: Card) {
        self.card = card
    }
    
    
}
