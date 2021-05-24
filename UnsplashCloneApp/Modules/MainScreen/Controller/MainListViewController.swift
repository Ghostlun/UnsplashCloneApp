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
            self.collectionView.backgroundColor = nil
        }
    }
    
    lazy var mainListViewModel = MainListViewModel(delegate: self, viewController: self)
    let userDefault = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Unsplash"
        self.mainListViewModel.fetchInitialData()
        self.mainListViewModel.openFirstTimeView(isNotFirst: userDefault.bool(forKey: "isNotFirst"))
        setupHeader()
    }
    
    private func setupHeader() {
        let header = StretchingHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 6))
        header.imageView.image = UIImage(named: "picture.jpg") ?? UIImage()
        tableView.tableHeaderView = header
    }
}

extension MainListViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainListViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sendData = self.mainListViewModel.photo(at: indexPath.row)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SplashTableViewCell.reuseIdentifier, for: indexPath) as? SplashTableViewCell else { return UITableViewCell() }
        
        cell.configure(configurator: sendData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailData = self.mainListViewModel.photo(at: indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(identifier: DetailsViewController.reuseIdentifier) as? DetailsViewController
        else { return }
        detailViewController.detailsData = detailData
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StretchingHeaderView else { return }
        header.whenScrollDid(scrollView: scrollView)
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
        
        if indexPath.row == 0 {
            setupHeader()
            mainListViewModel.fetchInitialData()
        } else {
            tableView.tableHeaderView = nil
            let category = mainListViewModel.collectionViewDataSource[indexPath.row]
            mainListViewModel.fetchDataByCategory(category: category)
        }
    }
}

extension MainListViewController: MainViewModelProtocol {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
