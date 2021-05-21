//
//  MyProfileViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/14/21.
//

import FirebaseAuth
import FirebaseFirestore
import UIKit

protocol MyProfileViewModelDelegate: AnyObject {
    func reloadProfile()
}

class MyProfileViewModel {
    
    let viewController: UIViewController
    let db = Firestore.firestore()
    
    var likeImageDataSource: [[String: String]]
    var uploadImageDataSource: [String] = []
    weak var delegate: MyProfileViewModelDelegate?
    
    init(delegate: MyProfileViewModelDelegate, viewController: UIViewController) {
        self.viewController = viewController
        self.delegate = delegate
        self.likeImageDataSource = [[:]]
    }
    
    func fetchData(_ completion: () -> Void) {
        let uid = Auth.auth().currentUser?.uid ?? "No data"
        db.collection("users").document(uid).getDocument { document, error in
            if error != nil {
                print(error ?? "error")
            }
            if let documentData = document?.data() {
                let data = documentData.compactMapValues { $0 as? String }
                let user = User(firstName: data["firstName"] ?? "", lastName: data["lastName"] ?? "", userName: data["userName"] ?? "", email: data["userName"] ?? "", password: data["password"] ?? "")
                guard let vc = self.viewController as? MyProfileViewController else { return }
                vc.configureData(userData: user)
                self.likeImageDataSource = documentData["likePicture"] as? [[String: String]] ?? [[:]]
                self.uploadImageDataSource = documentData["uploadImage"] as? [String] ?? []
                self.delegate?.reloadProfile()
            } else { print("Failed to get Data") }
        }
    }
    
    
    func numberOfRows(index: Int) -> Int {
        switch index {
        case 0:
            return uploadImageDataSource.count
        case 1:
            return likeImageDataSource.count
        case 2:
            return 0
        default:
            return 0
        }
    }
    
    func configuredData(index: Int) -> URL {
        convertToUrl(url: uploadImageDataSource[index])
    }
    
    func configureLikeData(index: Int) -> URL {
        let data = likeImageDataSource[index]
        return convertToUrl(url: data["imageUrl"] ?? "")
    }
    
    func convertToUrl(url: String) -> URL {
        guard let url = URL(string: url) else { fatalError("No Address") }
        return url
    }
}
