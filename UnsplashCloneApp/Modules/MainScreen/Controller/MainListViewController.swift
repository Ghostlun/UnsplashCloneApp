//
//  ViewController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/5/21.
//

import UIKit

class MainListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.register(UINib(nibName: SplashTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: SplashTableViewCell.reuseIdentifier)
        }
    }
    
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        }
    }
    
    lazy var mainListViewModel = MainListViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Unsplash"
        mainListViewModel.fetchModel()
    }
    
    
}

extension MainListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainListViewModel.numberOfRows()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sendData = self.mainListViewModel.photo(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SplashTableViewCell.reuseIdentifier, for: indexPath) as? SplashTableViewCell else { return UITableViewCell() }
        
        cell.configure(configurator: sendData)
        return cell
        
    }
    
    
}

extension MainListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mainListViewModel.numbersOfCollectionRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sendData = self.mainListViewModel.category(at: indexPath.row)
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCategoryCell.reuseIdentifier,
                                                            for: indexPath) as? CollectionViewCategoryCell else { return UICollectionViewCell() }
        cell.configure(data: sendData)
        return cell
    }
    
}


extension MainListViewController: MainViewModelProtocol {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
        }
    }
}
