//
//  ViewController.swift
//  PatternsExample
//
//  Created by Yury Popov on 16.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet private var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var viewModel: CardsListViewModelProtocol! {
        didSet {
            viewModel.fetchCards {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CardsListViewModel()
        setupNavigationBar()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let detailVC = segue.destination as! CardDetailsViewController
        viewModel.selectedRow(for: indexPath)
        detailVC.viewModel = viewModel.viewModelForSelectedRow()
    }
    
    
    private func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell",
                                                 for: indexPath) as! CardTableViewCell
        
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel
    
        return cell
    }
    
    
    
}





