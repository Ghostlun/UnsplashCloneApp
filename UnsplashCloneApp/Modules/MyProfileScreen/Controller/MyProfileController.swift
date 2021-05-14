//
//  MyProfileController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/11/21.
//

import UIKit

class MyProfileController: UIViewController {
    
    @IBOutlet private weak var userLabel: UILabel!
    
    lazy var myProfileViewModel = MyProfileViewModel(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myProfileViewModel.fetchData()
    }
}
