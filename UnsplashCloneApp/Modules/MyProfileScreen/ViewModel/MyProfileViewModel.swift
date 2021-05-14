//
//  MyProfileViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/14/21.
//

import FirebaseAuth
import FirebaseFirestore
import UIKit

class MyProfileViewModel {

    let viewController: UIViewController
    let db = Firestore.firestore()
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func fetchData() {
        let uid = Auth.auth().currentUser?.uid ?? "No data"
        print(uid)
        db.collection("users").document(uid).getDocument { document, error in
            if error != nil {
                print(error ?? "error")
            }
            if let documentData = document?.data() {
                print(documentData["firstName"] ?? "No firstName")
                print(documentData["lastName"] ?? "No lastName")
        } else { print("Failed to get Data") }
        }
    }
}
