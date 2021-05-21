//
//  SearchTableViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/10/21.
//

import Foundation
import UIKit

class SearchTableViewModel: SplashCellViewModelProtocol {
   
    init(searchResultModel: PhotoResult) {
        self.searchResultModel = searchResultModel
    }
    
    var searchResultModel: PhotoResult
    
    var provider: String {
        "Jacob"
    }
    
    var imageInformation: URLAddress {
        searchResultModel.urls
    }
    
    var imageName: String {
        searchResultModel.description ?? ""
    }
        
    var shareUrlAddress: String {
        searchResultModel.urls.raw
    }
    
    var mainImage: URL {
        guard let url = URL(string: searchResultModel.urls.raw) else { fatalError("No Address") }
        return url
    }
    
    var sharePictureAddress: String {
        searchResultModel.urls.raw
    }
    
    var shareSheetViewController: UIActivityViewController {
        let controller = UIActivityViewController(activityItems: [shareUrlAddress], applicationActivities: nil)
        return controller
    }
}
