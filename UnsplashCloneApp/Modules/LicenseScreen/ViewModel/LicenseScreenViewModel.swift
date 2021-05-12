//
//  LicenseScreenViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/12/21.
//

import Foundation
import UIKit

class LicenseScreenViewModel {
    
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    var shareSheetViewController: UIActivityViewController {
        let controller = UIActivityViewController(activityItems: ["Unsplash is a great app with beautiful images and wallpapers, check it out on the App Store. https://unsplash.com/"], applicationActivities: nil)
        return controller
    }
    
    func openUrlAddress(urlAddress: String) {
        guard let url = URL(string: urlAddress) else { return }
        UIApplication.shared.open(url, options: [ : ], completionHandler: nil)
    }
    
    func showActivity() {
        let view = self.shareSheetViewController
        viewController.present(view, animated: true, completion: nil)
    }
}
