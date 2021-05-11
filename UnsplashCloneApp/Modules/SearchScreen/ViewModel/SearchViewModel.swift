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
    
    private weak var delegate: SearchViewModelProtocol?
    
    private let router = Router<SearchApi>()
    
    init(delegate: SearchViewModelProtocol) {
        self.delegate = delegate
        self.dataSource = []
    }
    
    func photoResult(at index: Int) -> SplashCellViewModelProtocol {
        SearchTableViewModel(searchResultModel: dataSource[index])
    }
    
    func numbersOfTableViewRows() -> Int {
        dataSource.count
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
    
    func fetchItem(keyword: String) {
        self.router.request(SearchApi.search(query: keyword)) { [weak self] (result: Result<SearchModel, AppError>) in
            switch result {
            case .success(let splashData):
                self?.dataSource = splashData.results
                self?.delegate?.reloadData()

            case .failure(let error):
                print(error)
            }
        }
    }
}
