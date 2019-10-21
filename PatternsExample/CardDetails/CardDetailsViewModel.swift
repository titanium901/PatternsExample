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
        return getImageData()
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
    
    private func getImageData() -> Data? {
        guard let stringURL = card.image else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        return imageData
    }
}
