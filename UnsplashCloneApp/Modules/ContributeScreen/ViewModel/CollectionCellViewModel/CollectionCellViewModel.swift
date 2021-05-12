//
//  CollectionCellViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/11/21.
//

import Foundation
import UIKit

protocol CollectionCellViewModelProtocol {
    var mainImageUrl: URL { get }
    var provider: String { get }
    var titleOfImage: String { get }
    var newPageLinkUrl: String { get }
}

class CollectionCellViewModel: CollectionCellViewModelProtocol {
    
    var latestModel: LatestModel
    
    init(latestModel: LatestModel) {
        self.latestModel = latestModel
    }
    
    var mainImageUrl: URL {
        guard let url = URL(string: latestModel.urls?.small ?? "") else { fatalError("No Address") }
        return url
    }
    
    var provider: String {
        latestModel.user?.name ?? "Username"
    }
    
    var titleOfImage: String {
        latestModel.altDescription ?? "Description"
    }
    
    var newPageLinkUrl: String {
        latestModel.links?.html ?? ""
    }
}
