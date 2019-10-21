//
//  CardDetailViewController.swift
//  PatternsExampleMVC
//
//  Created by Yury Popov on 16.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import UIKit

class CardDetailsViewController: UIViewController {

    @IBOutlet weak var imageUrlLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var favouriteButton: UIButton!
    
    var card: Card!
    
    private var viewModel: CardDetailsViewModelProtocol! {
        didSet {
            valueLabel.text = viewModel.cardName
            codeLabel.text = viewModel.code
            imageUrlLabel.text = viewModel.imageUrl
            guard let imageData = viewModel.imageData else { return }
            cardImage.image = UIImage(data: imageData)
        }
    }
    
//    private var isFavourite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CardDetailsViewModel(card: card)
        setupUI()
        

    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        viewModel.isFavorite.toggle()
        let image = setImageForFavoriteButton()
        sender.setImage(image, for: .normal)
    }
    
    private func setupNavBar() {
        
    }
    
    private func setupUI() {
        let image = setImageForFavoriteButton()
        favouriteButton.setImage(image, for: .normal)
    }
    
    private func setImageForFavoriteButton() -> UIImage {
        return viewModel.isFavorite ? #imageLiteral(resourceName: "heartIcon") : #imageLiteral(resourceName: "unselectedHeart")
    }
    

}
