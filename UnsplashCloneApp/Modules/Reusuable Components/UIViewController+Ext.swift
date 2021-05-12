//
//  UIViewController+Ext.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/12/21.
//

import UIKit

extension UIViewController {
    
    func openUrlAddress(urlAddress: String) {
        guard let url = URL(string: urlAddress) else { return }
        UIApplication.shared.open(url, options: [ : ], completionHandler: nil)
    }
}
