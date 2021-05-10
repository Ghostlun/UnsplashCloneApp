//
//  searchViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/10/21.
//

import Foundation

class SearchViewModel {
    
    private var dataSource: [PhotoResult]?
    
    private let router = Router<SearchApi>()
    
    
    func fetchItem(keyword: String) {
        let keyword = "office"
        self.router.request(SearchApi.search(query: keyword)) { [weak self] (result: Result<SearchModel, AppError>) in
            switch result {
            case .success(let splashData):
                print(splashData)
                self?.dataSource = splashData.results
    
            case .failure(let error):
                print(error)
            }
        }
    }    
}
