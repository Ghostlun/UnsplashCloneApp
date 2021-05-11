//
//  LoginController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/11/21.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        checkUserLogin()
    }
    
//    func checkUserLogin () {
//        if let user = Auth.auth().currentUser {
//            print("Already Sign Ined")
//        }
//    }
//
//    @IBAction func loginButtonClicked {
//    Auth.auth().signIn(withEmail: emailTextField.text ?? "", password: (passwordTextField ?? "") as! String) { (user, error )in
//
//                if user != nil {
//                    print("Login Success")
//                }
//                else {
//                    print("Login failed)
//                }
//            }
//        }
//
//    }
}
