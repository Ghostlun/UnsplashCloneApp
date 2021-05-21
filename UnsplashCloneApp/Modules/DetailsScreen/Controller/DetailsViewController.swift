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
    var detailsViewModel: DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = detailsData?.imageName ?? ""
        guard let detailsData = detailsData else { return }
        self.detailsViewModel = DetailsViewModel(detailsData: detailsData, viewController: self)
        configure()

    }
    
    func configure() {
        mainImageView.sd_setImage(with: detailsViewModel?.imageUrlSomething())
    }
    
    @IBAction private func showActivity() {
        guard let view = detailsData?.shareSheetViewController else { return }
        self.present(view, animated: true, completion: nil)
    }
    
    @IBAction private func likeButtonClicked() {
        if checkUser() {
            detailsViewModel?.likeButtonClicked()
    } else {
            performSegue(withIdentifier: "openLoginSubView", sender: nil)
        }
    }
    
    @IBAction private func downloadImage() {
        if checkUser() {
            detailsViewModel?.downloadImage()
        } else {
            performSegue(withIdentifier: "openLoginSubView", sender: nil)
        }
    }
    
    @IBAction private func openDetailsSubView() {
        performSegue(withIdentifier: "openDetailsSubview", sender: nil)
    }
}
