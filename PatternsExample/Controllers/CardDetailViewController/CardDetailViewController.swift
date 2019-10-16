//
//  CardDetailViewController.swift
//  PatternsExampleMVC
//
//  Created by Yury Popov on 16.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {

    @IBOutlet weak var imageUrlLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var favouriteButton: UIButton!
    
    var card: Card!
    
    private var isFavourite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFavouriteStatus()
        setupUI()
        

    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        isFavourite.toggle()
        let image = setImageForFavoriteButton()
        sender.setImage(image, for: .normal)
        DataManager.shared.saveFavouriteStatus(for: card.value ?? "", with: isFavourite)
    }
    
    private func setupNavBar() {
        
    }
    
    private func setupUI() {
        imageUrlLabel.text = card.image
        valueLabel.text = card.value
        codeLabel.text = card.code
        
        guard let imageURL = URL(string: card.image!) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        cardImage.image = UIImage(data: imageData)
        
        let image = setImageForFavoriteButton()
        favouriteButton.setImage(image, for: .normal)
    }
    
    private func setImageForFavoriteButton() -> UIImage {
        return isFavourite ? #imageLiteral(resourceName: "heartIcon") : #imageLiteral(resourceName: "unselectedHeart")
    }
    
    private func loadFavouriteStatus() {
        isFavourite = DataManager.shared.loadFavouriteStatus(for: card.value ?? "")
    }

}
