//
//  LoginViewController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/12/21.
//

import UIKit

class LoginSubviewController: UIViewController, CellReusable {
    
    @IBOutlet private weak var loginUIView: UIView!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField! {
        didSet {
            self.passwordTextField.isSecureTextEntry = true
        }
    }
        
    lazy var loginViewModel = LoginViewModel(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginUIView.makeRoundRectangleImageView(cornerRadius: 10.0)
        if checkUser() {
            loginViewModel.openTheProfilePage()
        }
    }
    
    @IBAction private func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func signIn() {
        loginViewModel.signIn(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @IBAction private func openRegisterScreen() {
        loginViewModel.openRegisterPage()
    }
}
