//
//  DetailsViewController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/10/21.
//

import UIKit

class DetailsViewController: UIViewController, CellReusable {
    
    @IBOutlet private weak var mainImageView: UIImageView!
  
    var detailsData: SplashCellViewModelProtocol?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = detailsData?.imageName ?? ""
        guard let detailsData = detailsData else { return }
        configure(with: detailsData)
    }
    
    func configure(with information: SplashCellViewModelProtocol) {
        mainImageView.sd_setImage(with: information.mainImage)
    }
    
    @IBAction private func showActivity() {
        guard let view = detailsData?.shareSheetViewController else { return }
        self.present(view, animated: true, completion: nil)
    }
}
