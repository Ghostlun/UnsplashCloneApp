//
//  SearchViewController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/10/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            self.tableView.register(UINib(nibName: SplashTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: SplashTableViewCell.reuseIdentifier)
            self.tableView.register(UINib(nibName: CollectionTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CollectionTableViewCell.reuseIdentifier)
            self.tableView.register(UINib(nibName: UsersTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: UsersTableViewCell.reuseIdentifier)
        }
    }
    
    @IBOutlet private var searchSegmentedControl: UISegmentedControl!
    
    var optionType: String = "Main"
    
    lazy var searchViewModel = SearchViewModel(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchViewController: UISearchBarDelegate {
        
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchViewModel.fetchItem(keyword: searchBar.text ?? "", type: searchBar.selectedScopeButtonIndex )
        tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchViewModel.numbersOfTableViewRows(type: searchBar.selectedScopeButtonIndex)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch searchBar.selectedScopeButtonIndex {
        case 0:
            let photoResult = searchViewModel.photoResult(at: indexPath.row)
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SplashTableViewCell.reuseIdentifier, for: indexPath) as? SplashTableViewCell else { return UITableViewCell() }
            cell.configure(configurator: photoResult)
            return cell
            
        case 1:
            let collectionResult = searchViewModel.collectionResult(at: indexPath.row)
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.reuseIdentifier, for: indexPath) as? CollectionTableViewCell else { return UITableViewCell() }
            cell.configure(data: collectionResult)
            return cell
            
        case 2:
            let userResult = searchViewModel.userResult(at: indexPath.row)
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.reuseIdentifier, for: indexPath) as? UsersTableViewCell else { return UITableViewCell() }
            cell.configure(userResult)
            return cell
            
        default:
            print("error")
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell clicked")
        navigationController?.pushViewController(searchViewModel.openDetailsScreen(indexPath), animated: true)
    }
}

extension SearchViewController: SearchViewModelProtocol {
        func reloadData() {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
}
