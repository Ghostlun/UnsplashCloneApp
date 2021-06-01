//
//  DetailsViewController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/10/21.
//

import Hero
import UIKit

class DetailsViewController: UIViewController, CellReusable {
    
    @IBOutlet private weak var mainImageView: UIImageView! {
        didSet {
            mainImageView.heroID = "updates"
        }
    }
  
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
    
    @IBAction private func handlePan(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            hero.dismissViewController()
            
        case .changed:
            let transition = sender.translation(in: nil)
            let progress = transition.y / 2 / view.bounds.height
            let currentPos = CGPoint(x: transition.x + self.mainImageView.center.x, y: transition.y + self.mainImageView.center.y)
            Hero.shared.apply(modifiers: [.position(currentPos)], to: mainImageView)
            Hero.shared.update(progress)
            
        default:
            print("Call")
            Hero.shared.finish()
        }
    }
}
