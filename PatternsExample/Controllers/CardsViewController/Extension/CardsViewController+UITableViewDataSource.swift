//
//  CardsViewController+UITableViewDataSource.swift
//  PatternsExample
//
//  Created by Yury Popov on 16.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import UIKit

// MARK: - UITableViewDataSource
extension CardsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell",
                                                 for: indexPath) as! CardTableViewCell
        let course = cards[indexPath.row]
        cell.configure(with: course)
        
        return cell
    }
}
