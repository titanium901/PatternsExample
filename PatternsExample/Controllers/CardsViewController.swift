//
//  ViewController.swift
//  PatternsExample
//
//  Created by Yury Popov on 16.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    private var cards: [Card] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCards()
        setupNavigationBar()
        
    }

    
    private func getCards() {
        NetworkManager.shared.fetchData() { cards in
            self.cards = cards
            print(cards)
            DispatchQueue.main.async {
//                self.tableView.reloadData()
            }
        }
    }
    
    private func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
}

