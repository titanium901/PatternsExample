//
//  DataManager.swift
//  PatternsExample
//
//  Created by Yury Popov on 16.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    func saveFavouriteStatus(for cardValue: String, with status: Bool) {
        userDefaults.set(status, forKey: cardValue)
    }
    
    func loadFavouriteStatus(for cardValue: String) -> Bool {
        return userDefaults.bool(forKey: cardValue)
    }
}
