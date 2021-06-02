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
            self.tableView.register(UINib(nibName: HistoryViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: HistoryViewCell.reuseIdentifier)
            self.tableView.register(UINib(nibName: SplashTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: SplashTableViewCell.reuseIdentifier)
            self.tableView.register(UINib(nibName: CollectionTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CollectionTableViewCell.reuseIdentifier)
            self.tableView.register(UINib(nibName: UsersTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: UsersTableViewCell.reuseIdentifier)
            self.tableView.register(UINib(nibName: HistoryHeaderView.reuseIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: HistoryHeaderView.reuseIdentifier)
        }
    }
    
    @IBOutlet private var searchSegmentedControl: UISegmentedControl!
    
    let userDefault = UserDefaults()
    var historyDataSource: [String]?
    var isMain = true
    
    lazy var searchViewModel = SearchViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.historyDataSource = userDefault.array(forKey: "History") as? [String] ?? []
        tableView.reloadData()
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text ?? ""
        historyDataSource?.append(searchText)
        userDefault.setValue(historyDataSource, forKey: "History")
        searchViewModel.fetchItem(keyword: searchBar.text ?? "", type: searchBar.selectedScopeButtonIndex )
        isMain = false
        tableView.tableHeaderView?.frame = CGRect.zero
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        let searchText = searchBar.text ?? ""
        searchViewModel.fetchItem(keyword: searchText, type: searchBar.selectedScopeButtonIndex )
        tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isMain == true {
            return historyDataSource?.count ?? 0
        }
        return searchViewModel.numbersOfTableViewRows(type: searchBar.selectedScopeButtonIndex)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isMain {
            let history = historyDataSource?[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryViewCell.reuseIdentifier, for: indexPath) as? HistoryViewCell else { return UITableViewCell() }
            cell.configure(history: history ?? "" )
            return cell
        }
        
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
        if isMain == false {
        navigationController?.pushViewController(searchViewModel.openDetailsScreen(indexPath), animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableView.reloadInputViews()
        if isMain == false {
            tableView.tableHeaderView = nil
            tableView.tableHeaderView = UIView()
            return nil
        }
        
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: HistoryHeaderView.reuseIdentifier) as? HistoryHeaderView else { return UIView() }
        headerCell.configure()
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}

extension SearchViewController: SearchViewModelProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
