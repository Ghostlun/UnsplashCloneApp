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
    
    weak var delegate: MainViewModelProtocol?
    
    var collectionViewDataSource: [String] = ["Editorial", "Wallpapers", "Nature", "People", "Architecture", "Current Events", "Businnes & work", "Experimental", "Fashion", "Film", "Health & Wellness", "Interiors", "Street Photography", "Technology", "Travel", "Textures & Patterns", "Animals", "Food & Drink", "Athletics"]
    
    private var dataSource: [SplashCellViewModelProtocol] {
        didSet {
            self.delegate?.reloadData()
        }
    }
    
    init(delegate: MainViewModelProtocol) {
        self.delegate = delegate
        self.dataSource = []
    }
    
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
    
    
    func fetchModel() {
        let networkManger = NetworkManager()
        networkManger.getSplashInformation { [weak self] splashDatas, _ in
            guard splashDatas != nil else { return }
            let compactedData = splashDatas?.compactMap {
                SplashCellViewModel(splashModel: $0)
            }
            guard let unwrappedCompactedData = compactedData else { return }
            guard let self = self else { return }
            self.dataSource = unwrappedCompactedData
        }
    }
}
