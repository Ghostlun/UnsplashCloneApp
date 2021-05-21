//
//  SplashCellViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/7/21.
//

import Foundation
import SDWebImage
import UIKit

protocol SplashCellViewModelProtocol {
    var provider: String { get }
    var mainImage: URL { get }
    var shareUrlAddress: String { get }
    var imageName: String { get }
    var imageInformation: URLAddress { get }
    var shareSheetViewController: UIActivityViewController { get }
}

class SplashCellViewModel: SplashCellViewModelProtocol {
    
    private var splashModel: SplashModel
    
    init(splashModel: SplashModel) {
        self.splashModel = splashModel
    }
    
    var provider: String {
        splashModel.title
    }
    
    var mainImage: URL {
        guard let url = URL(string: splashModel.coverPhoto.urls?.small ?? "https://www.w3schools.com/images/picture.jpg") else { fatalError("No Address") }
        return url
    }
    
    var shareUrlAddress: String {
        splashModel.coverPhoto.urls?.small ?? "https://www.w3schools.com/images/picture.jpg"
    }
    
    var imageInformation: URLAddress {
        guard let urls = splashModel.coverPhoto.urls else { fatalError("Failed to unwrapped") }
        return urls
    }
    
    var imageName: String {
        splashModel.title
    }
    
    var shareSheetViewController: UIActivityViewController {
        let controller = UIActivityViewController(activityItems: [shareUrlAddress], applicationActivities: nil)
        return controller
    }
}
