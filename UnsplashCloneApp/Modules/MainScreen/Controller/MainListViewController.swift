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
            self.tableView.register(UINib(nibName: TitleTableCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: TitleTableCell.reuseIdentifier)
        }
    }
    
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.backgroundColor = nil
        }
    }
    
    lazy var mainListViewModel = MainListViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Unsplash"
        self.mainListViewModel.fetchPhotoDetails()
    }
}

extension MainListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainListViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sendData = self.mainListViewModel.photo(at: indexPath.row)

        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableCell.reuseIdentifier, for: indexPath) as? TitleTableCell else { return UITableViewCell()
            }
            cell.configure(configurator: sendData)
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SplashTableViewCell.reuseIdentifier, for: indexPath) as? SplashTableViewCell else { return UITableViewCell() }
    
        cell.configure(configurator: sendData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(mainListViewModel.openDetailsScreen(indexPath), animated: true)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = mainListViewModel.collectionViewDataSource[indexPath.row]
        print("Did Select \(category)")
        mainListViewModel.fetchPhotoDetails(category: category)
    }
}

extension MainListViewController: MainViewModelProtocol {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
