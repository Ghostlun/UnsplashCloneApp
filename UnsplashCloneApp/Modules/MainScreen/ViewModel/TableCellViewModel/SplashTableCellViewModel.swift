//
//  SplashTableCellViewModel.swift
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
    var imageInformation: ImageDetailsInformation { get }
    var shareSheetViewController: UIActivityViewController { get }
}

class SplashCellViewModel: SplashCellViewModelProtocol {
        
    private var splashModel: SplashModel

    init(splashModel: SplashModel) {
        self.splashModel = splashModel
    }
    
    var provider: String {
        splashModel.tags[0].source?.coverPhoto?.id ?? ""
    }
    
    var mainImage: URL {
        guard let url = URL(string: splashModel.tags[0].source?.coverPhoto?.urls?.regular ?? "https://www.w3schools.com/images/picture.jpg") else { fatalError("No Address")}
        return url
    }
    
    var shareUrlAddress: String {
        splashModel.tags[0].source?.coverPhoto?.urls?.regular ?? ""
    }
    
    var imageInformation: ImageDetailsInformation {
        ImageDetailsInformation()
    }
    
    var imageName: String {
        splashModel.title
    }
    
    var shareSheetViewController: UIActivityViewController {
        let controller = UIActivityViewController(activityItems: [shareUrlAddress], applicationActivities: nil)
        return controller
    }
}
