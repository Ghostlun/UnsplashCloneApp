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
    private let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    private let viewController: UIViewController

    weak var delegate: MainViewModelProtocol?
    
    private var mainDataSource: [SplashCellViewModelProtocol] {
        didSet {
            self.delegate?.reloadData()
        }
    }
    
    var isMain = true
    
    init(delegate: MainViewModelProtocol, viewController: UIViewController) {
        self.delegate = delegate
        self.viewController = viewController
        self.mainDataSource = []
    }
    
    var collectionViewDataSource: [String] = ["Editorial", "Wallpapers", "Nature", "People", "Architecture", "Current Events", "Businnes & work", "Experimental", "Fashion", "Film"]
    
//    Hard corded cateogry  " "Health & Wellness", ""Interiors", "Street Photography",
//    "Technology", "Travel", "Textures & Patterns", "Animals", "Food & Drink", "Athletics"
    
    func openFirstTimeView(isNotFirst: Bool) {
        if isNotFirst == false {
        if let firstView = storyboard.instantiateViewController(identifier: FirstViewController.reuseIdentifier) as? FirstViewController {
            viewController.navigationController?.present(firstView, animated: true)
        } else {
            print("Can't find storyboard")
        }
        }
    }
    
    func numbersOfCollectionRows() -> Int {
        collectionViewDataSource.count
    }
    
    func category(at index: Int) -> String {
        collectionViewDataSource[index]
    }
    
    func numberOfRows() -> Int {
        self.mainDataSource.count
    }
    
    func photo(at index: Int) -> SplashCellViewModelProtocol {
        self.mainDataSource[index]
    }
    
    func fetchInitialData() {
        isMain = true
        self.router.request(SplashCollectionApi.searchByDefault) { [weak self] (result: Result<SplashModels, AppError>) in
            switch result {
            case .success(let splashData):
                let compactedData = splashData.compactMap {
                    SplashCellViewModel(splashModel: $0)
                }
                self?.delegate?.reloadData()
                self?.mainDataSource = compactedData
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchDataByCategory(category: String) {
        isMain = false
        let categoryLowerCase = category.lowercased()
        self.router.request(SplashCollectionApi.searchByCategory(category: categoryLowerCase)) { [weak self] (result: Result<TopicSplashModels, AppError>) in
            switch result {
            case .success(let splashData):
                let compactedData = splashData.compactMap {
                    TopicDataCellViewModel(topicSplashModel: $0)
                }
                self?.delegate?.reloadData()
                self?.mainDataSource = compactedData
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
