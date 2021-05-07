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
        guard let  url = URL(string: splashModel.tags[0].source?.coverPhoto?.urls?.regular ?? "https://www.w3schools.com/images/picture.jpg") else { fatalError("No Address")}
        return url
    }
}
