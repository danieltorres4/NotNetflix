//
//  SearchViewController.swift
//  NotNetflix
//
//  Created by Daniel Sanchez Torres on 01/11/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(searchTableView)
        searchTableView.delegate = self
        searchTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchTableView.frame = view.bounds
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    
}
