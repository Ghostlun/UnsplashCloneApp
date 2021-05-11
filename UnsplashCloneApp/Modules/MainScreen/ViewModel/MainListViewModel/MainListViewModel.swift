//
//  MainListViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/7/21.
//

import Foundation
import UIKit

protocol MainViewModelProtocol: AnyObject {
    func reloadData()
}

class MainListViewModel {
    
    private let router = Router<SplashCollectionApi>()
    
    weak var delegate: MainViewModelProtocol?
    
    
    
    private var dataSource: [SplashCellViewModelProtocol] {
        didSet {
            self.delegate?.reloadData()
        }
    }
    
    init(delegate: MainViewModelProtocol) {
        self.delegate = delegate
        self.dataSource = []
    }
    
    var collectionViewDataSource: [String] = ["Editorial", "Wallpapers", "Nature", "People", "Architecture", "Current Events", "Businnes & work", "Experimental", "Fashion", "Film", "Health & Wellness", "Interiors", "Street Photography", "Technology", "Travel", "Textures & Patterns", "Animals", "Food & Drink", "Athletics"]
    
    func numbersOfCollectionRows() -> Int {
        collectionViewDataSource.count
    }
    
    func category(at index: Int) -> String {
        collectionViewDataSource[index]
    }
    
    func numberOfRows() -> Int {
        self.dataSource.count
    }
    
    func photo(at index: Int) -> SplashCellViewModelProtocol {
        self.dataSource[index]
    }
    
    func openDetailsScreen(_ indexPath: IndexPath) -> DetailsViewController{
        let detailData = self.photo(at: indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let detailViewController = storyboard.instantiateViewController(identifier: DetailsViewController.reuseIdentifier) as? DetailsViewController {
            detailViewController.detailsData = detailData
            return detailViewController
        } else {
            print("Can't find storyboard")
        }
        return DetailsViewController()
    }
    
    func fetchPhotoDetails() {
        self.router.request(SplashCollectionApi.collection) { [weak self] (result: Result<SplashModels, AppError>) in
            switch result {
            case .success(let splashData):
                let compactedData = splashData.compactMap {
                    SplashCellViewModel(splashModel: $0)
                }
                
                self?.dataSource = compactedData
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
