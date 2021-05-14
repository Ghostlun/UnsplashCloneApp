//
//  UIViewController+Ext.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/12/21.
//

import FirebaseAuth
import UIKit

extension UIViewController {
    
    func openUrlAddress(urlAddress: String) {
        guard let url = URL(string: urlAddress) else { return }
        UIApplication.shared.open(url, options: [ : ], completionHandler: nil)
    }
    
    func checkUser() -> Bool {
     if Auth.auth().currentUser != nil {
            return true
        }
    return false
    }
}
