//
//  LoginViewController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/12/21.
//

import UIKit

class LoginSubviewController: UIViewController, CellReusable {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        self.dismiss(animated: true, completion: nil)
    }
}
