//
//  DetailsViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/17/21.
//

import FirebaseAuth
import FirebaseFirestore
import UIKit

class DetailsViewModel {
    
    var detailsData: SplashCellViewModelProtocol
    var viewController: UIViewController
    let db = Firestore.firestore()

    init(detailsData: SplashCellViewModelProtocol, viewController: UIViewController) {
        self.detailsData = detailsData
        self.viewController = viewController
    }
    
    func imageUrlSomething() -> URL {
         detailsData.mainImage
    }
    
    func downloadImage() {
        
        if  let data = try? Data(contentsOf: detailsData.mainImage),
            let image = UIImage(data: data) {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        self.viewController.showToast(controller: viewController, message: "Image Downloaded", seconds: 1)
    }
    
    func likeButtonClicked() {
        print("Like button clicked")
        uploadLikePictureInformation()
    }

    func uploadLikePictureInformation() {
        let likeImage: [String: Any] = ["imageUrl": detailsData.shareUrlAddress, "provider": detailsData.provider]
        let uid = Auth.auth().currentUser?.uid ?? "No data"
        self.db.collection("users").document(uid).updateData(["likePicture": FieldValue.arrayUnion([likeImage])])
    }
}
