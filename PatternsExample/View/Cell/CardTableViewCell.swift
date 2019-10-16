//
//  CardTableViewCell.swift
//  PatternsExample
//
//  Created by Yury Popov on 16.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    func configure(with card: Card) {
        textLabel?.text = card.value
        guard let imageURL = URL(string: card.image!) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        imageView?.image = UIImage(data: imageData)
    }
}
