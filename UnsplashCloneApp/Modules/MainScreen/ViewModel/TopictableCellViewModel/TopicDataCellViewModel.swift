//
//  TopicDataCellViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/14/21.
//

import Foundation
import UIKit

class TopicDataCellViewModel: SplashCellViewModelProtocol {
    
    var topicSplashModel: TopicSplashModel
    
    init(topicSplashModel: TopicSplashModel) {
        self.topicSplashModel = topicSplashModel
    }
    
    var provider: String {
        topicSplashModel.users?.name ?? ""
    }
    
    var mainImage: URL {
        guard let url = URL(string: topicSplashModel.urls?.small ?? "https://www.w3schools.com/images/picture.jpg") else { fatalError("No Address") }
        return url
    }
    
    var shareUrlAddress: String {
        topicSplashModel.links?.html ?? ""
    }
    
    var imageName: String {
        topicSplashModel.description ?? ""
    }
    
    var imageInformation: ImageDetailsInformation {
        ImageDetailsInformation()
    }
    
    var shareSheetViewController: UIActivityViewController {
        let controller = UIActivityViewController(activityItems: [shareUrlAddress], applicationActivities: nil)
        return controller
    }
}
