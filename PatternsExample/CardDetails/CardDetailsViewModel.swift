//
//  CardDetailsViewModel.swift
//  PatternsExampleMVC
//
//  Created by Yury Popov on 21.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import Foundation

class CardDetailsViewModel: CardDetailsViewModelProtocol {
    
    var cardName: String? {
        return card.value
    }
    
    var code: String? {
        return card.code
    }
    
    var imageUrl: String? {
        return card.image
    }
    
    var imageData: Data? {
        return ImageManager.shared.getImageData(from: card.image)
    }
    
    var isFavorite: Bool {
        get {
            return DataManager.shared.loadFavouriteStatus(for: card.value ?? "")
        }
        set {
            DataManager.shared.saveFavouriteStatus(for: card.value ?? "", with: newValue)
        }
    }
    
    private var card: Card!
    
    required init(card: Card) {
        self.card = card
    }
    
}
