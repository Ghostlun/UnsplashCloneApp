//
//  LoginController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/11/21.
//

// Test Id: test123@gmail.com
// Password: 1211asdF
//    if Auth.auth().currentUser != nil {}

import FirebaseAuth
import UIKit

class LoginController: UIViewController {
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func loginButtonClicked() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { user, _ in
            if user != nil {
                print("Login Success")
                self.signIn.setTitle("Sign Out", for: .normal)
            } else {
                print("Login Fails")
            }
        }
    }
}
