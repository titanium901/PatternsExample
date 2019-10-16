//
//  NetworkManager.swift
//  PatternsExample
//
//  Created by Yury Popov on 16.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let cardsURL = "https://deckofcardsapi.com/api/deck/new/draw/?count=52"
    
    func fetchData(completion: @escaping (_ cards: [Card])->()) {
        guard let url = URL(string: cardsURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let cards = try decoder.decode(Cards.self, from: data)
                completion(cards.cards)
                print(cards)
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}
