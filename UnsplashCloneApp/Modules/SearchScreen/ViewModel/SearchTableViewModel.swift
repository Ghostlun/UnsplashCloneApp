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
         ""
    }
    
    var imageInformation: ImageDetailsInformation {
        ImageDetailsInformation()
    }
    
    var imageName: String {
        searchResultModel.description ?? ""
    }
        
    var shareUrlAddress: String {
        searchResultModel.urls.full ?? ""
    }
    
    var mainImage: URL {
        guard let url = URL(string: searchResultModel.urls.full ?? "https://www.w3schools.com/images/picture.jpg") else { fatalError("No Address") }
        return url
    }
    
    var sharePictureAddress: String {
        searchResultModel.urls.full ?? ""
    }
    
    var shareSheetViewController: UIActivityViewController {
        let controller = UIActivityViewController(activityItems: [shareUrlAddress], applicationActivities: nil)
        return controller
    }
}
