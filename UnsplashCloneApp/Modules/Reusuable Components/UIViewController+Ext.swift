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
    
    func showToast(controller: UIViewController, message: String, seconds: Double ) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        controller.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}
