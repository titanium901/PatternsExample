//
//  CardDetailsViewModelProtocol.swift
//  PatternsExampleMVC
//
//  Created by Yury Popov on 21.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import Foundation

protocol CardDetailsViewModelProtocol {
    var cardName: String? { get }
    var code: String? { get }
    var imageUrl: String? { get }
    var imageData: Data? { get }
    var isFavorite: Bool { get set }
    init(card: Card)
}
