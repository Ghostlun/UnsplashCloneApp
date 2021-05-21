//
//  FirstViewController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/17/21.
//

import UIKit

class FirstViewController: UIViewController, CellReusable {
    
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    let userDefaults = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func startButtonClicked() {
        userDefaults.setValue(true, forKey: "isNotFirst")
        self.dismiss(animated: true)
    }
}
