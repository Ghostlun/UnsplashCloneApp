//
//  LoginViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/13/21.
//

import FirebaseAuth
import UIKit

class LoginViewModel {
    
    let viewController: UIViewController
    let userName: String = ""
    let storyboard: UIStoryboard
    
    init(viewController: UIViewController) {
        self.viewController = viewController
        self.storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    func signIn(email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { user, _ in
        if user != nil {
            print("Login Success")
            self.openTheProfilePage()
        } else {
            self.viewController.showAlert(title: "Incorrect Id and Password", message: "Please check id and password", buttons: [.ok]) { _, _ in }
            
            print("Login Fails")
        }
    }
    }
    
    func openTheProfilePage() {
        if let profileController = storyboard.instantiateViewController(identifier: "MyProfileController") as? MyProfileController {
            self.viewController.present(profileController, animated: true, completion: nil)
        }
    }
    
    func openRegisterPage() {
        if let registerController = storyboard.instantiateViewController(identifier: "RegisterViewController") as? RegisterViewController {
            self.viewController.present(registerController, animated: true, completion: nil)
        }
    }
}
