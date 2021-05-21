//
//  DetailsInfoSubViewController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/21/21.
//

import UIKit

class DetailsInfoSubViewController: UIViewController {
    
    @IBOutlet private weak var makeInfoLabel: UILabel!
    @IBOutlet private weak var modelInfoLabel: UILabel!
    @IBOutlet private weak var shutterSpeedInfoLabel: UILabel!
    @IBOutlet private weak var aperatureInfoLabel: UILabel!
    @IBOutlet private weak var focalLengthInfoLabel: UILabel!
    @IBOutlet private weak var isoInfoLabel: UILabel!
    @IBOutlet private weak var dimensionLabel: UILabel!
    @IBOutlet private weak var publishedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(ImageDetailsInformation())
    }
    
    func configure(_ data: ImageDetailsInformation) {
        makeInfoLabel.text = data.make
        modelInfoLabel.text = data.model
        shutterSpeedInfoLabel.text = data.shutterSpeed
        aperatureInfoLabel.text = data.aperture
        focalLengthInfoLabel.text = "\(data.focalLength)"
        isoInfoLabel.text = "\(data.iso)"
        dimensionLabel.text = data.dimension
        publishedLabel.text = data.published
    }
    
   @IBAction private func cancelButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }
}
