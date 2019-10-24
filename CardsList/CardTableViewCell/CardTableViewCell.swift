//
//  CardTableViewCell.swift
//  PatternsExample
//
//  Created by Yury Popov on 16.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    var viewModel: CardsTableViewCellViewModelProtocol! {
        didSet {
            textLabel?.text = viewModel.cardsValue
            guard let imageData = viewModel.imageData else { return }
            imageView?.image = UIImage(data: imageData)
        }
    }
}
