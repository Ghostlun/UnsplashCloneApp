//
//  searchViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/10/21.
//

import Foundation
import UIKit

protocol SearchViewModelProtocol: AnyObject {
    func reloadData()
}

class SearchViewModel {

    private var dataSource: [PhotoResult]
    private var collectionDataSource: [CollectionResult]
    private var userDataSource: [UserResult]
    
    private weak var delegate: SearchViewModelProtocol?
    
    private let router = Router<SearchApi>()
    
    init(delegate: SearchViewModelProtocol) {
        self.delegate = delegate
        self.dataSource = []
        self.collectionDataSource = []
        self.userDataSource = []
    }
    
    func photoResult(at index: Int) -> SplashCellViewModelProtocol {
        SearchTableViewModel(searchResultModel: dataSource[index])
    }
    
    func collectionResult(at index: Int) -> CollectionTableCellViewModelProtocol {
        CollectionTableCellViewModel(collectionResult: collectionDataSource[index])
    }
    
    func userResult(at index: Int) -> UserTableCellViewModelProtocol {
        UserTableCellViewModel(userResult: userDataSource[index])
    }
    
    func numbersOfTableViewRows(type: Int) -> Int {
        switch type {
        case 0:
            return dataSource.count
            
        case 1:
            return collectionDataSource.count
            
        case 2:
            return userDataSource.count

        default:
            print("Error")
        }
        return 0
    }
    
    func openDetailsScreen(_ indexPath: IndexPath) -> DetailsViewController {
        let detailData = self.photoResult(at: indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let detailViewController = storyboard.instantiateViewController(identifier: DetailsViewController.reuseIdentifier) as? DetailsViewController {
            detailViewController.detailsData = detailData
            return detailViewController
        } else {
            print("Can't find storyboard")
        }
        return DetailsViewController()
    }
    
    func fetchItem(keyword: String, type: Int) {
        
        switch type {
        case 0:
            self.router.request(SearchApi.searchPhotos(query: keyword)) { [weak self] (result: Result<SearchModel, AppError>) in
            switch result {
            case .success(let splashData):
                self?.dataSource = splashData.results
                self?.delegate?.reloadData()

            case .failure(let error):
                print(error)}
            }
            
        case 1:
            self.router.request(SearchApi.searchCollections(query: keyword)) { [weak self] (result: Result<CollectionSearchModel, AppError>) in
            switch result {
            case .success(let data):
                self?.collectionDataSource = data.results
                self?.delegate?.reloadData()
                print(data)

            case .failure(let error):
                print(error)}
            }
            
        case 2:
            self.router.request(SearchApi.searchUsers(query: keyword)) { [weak self] (result: Result<UserSearchModel, AppError>) in
            switch result {
            case .success(let data):
                self?.userDataSource = data.results
                self?.delegate?.reloadData()
                print(data)

            case .failure(let error):
                print(error)}
            }
            
        default:
            print("None")
        }
}
}
