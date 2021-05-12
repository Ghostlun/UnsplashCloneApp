//
//  LicenseViewController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/12/21.
//

import UIKit

class LicenseViewController: UIViewController {
    
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var recommendButton: UIButton!
    @IBOutlet private weak var reviewButton: UIButton!
    @IBOutlet private weak var feedbackButton: UIButton!
    @IBOutlet private weak var visitWebsiteButton: UIButton!
    @IBOutlet private weak var licenseButton: UIButton!

    lazy var licenseViewModel = LicenseScreenViewModel(viewController: self)
    lazy var mailHandler = ContactFunctionHandler(presenting: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.isHidden = true
        self.navigationItem.leftBarButtonItem = nil
    }
    
    @IBAction private func recommendButtonClicked() {
        licenseViewModel.showActivity()
    }
    
    @IBAction private func writeReviewButtonClicked() {
      openUrlAddress(urlAddress: "https://apps.apple.com/app/id1290631746?action=write-review")
    }
    
    @IBAction private func sendUsFeedbackButtonClicked() {
        let mail = mailHandler.sendMailWith(recipient: ["unsplash.com"], messageBody: "", subject: "Unsplash Feedback")
        present(mail, animated: true, completion: nil)
    }
    
    @IBAction private func visitSiteButtonClicked() {
      openUrlAddress(urlAddress: "https://unsplash.com/")
    }
    
    @IBAction private func licenseButtonClicked() {
       openUrlAddress(urlAddress: "https://unsplash.com/license")
    }
    
    @IBAction private func done() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UIButton {
    func addAlignmentIntoButtonText() {
        self.contentHorizontalAlignment = .left
    }
}
