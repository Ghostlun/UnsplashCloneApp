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
    
    lazy var mainListViewModel = MainListViewModel(delegate: self, viewController: self)
    let userDefault = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Unsplash"
        self.mainListViewModel.fetchInitialData()
        self.mainListViewModel.openFirstTimeView(isNotFirst: userDefault.bool(forKey: "isNotFirst"))
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: MainTableHeaderCell.reuseIdentifier ) as? MainTableHeaderCell else { return UIView() }
//        headerCell.configure(configurator: sendData)
//        return headerCell
        
        let header = StretcyHeaderView(frame:(CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)))
        header.myImageView.image = UIImage(named: "headerImage")
        return header
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        mainListViewModel.fetchInitialData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let detailData = self.mainListViewModel.photo(at: indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(identifier: DetailsViewController.reuseIdentifier) as? DetailsViewController
         else { return }
        detailViewController.detailsData = detailData
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        300
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
        mainListViewModel.fetchDataByCategory(category: category)
    }
}

extension MainListViewController: MainViewModelProtocol {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension MainListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.headerView as? StretcyHeaderView else { return }
        header.scrollViewDidScroll(scrollView: tableView)
    }
}
