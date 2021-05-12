//
//  ContributeViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/11/21.
//

import Foundation
import UIKit

protocol ContributeViewModelDelegate: AnyObject {
    func reloadData()
}

class ContributeViewModel {
    
    var router = Router<LatestCollectionApi>()
    var dataSource: [LatestModel]
    weak var delegate: ContributeViewModelDelegate?
    
    init(delegate: ContributeViewModelDelegate) {
        self.delegate = delegate
        dataSource = []
    }
        
    func photoResult(at index: Int) -> CollectionCellViewModelProtocol {
        CollectionCellViewModel(latestModel: dataSource[index])
    }
    
    func numbersOfCollectionViewRows() -> Int {
        dataSource.count
    }
    
    func fetchData() {
        router.request(LatestCollectionApi.collection) { [weak self] (result: Result<LatestModels, AppError>)  in
            switch result {
            case .success(let latestModel):
                self?.dataSource = latestModel
                self?.delegate?.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
