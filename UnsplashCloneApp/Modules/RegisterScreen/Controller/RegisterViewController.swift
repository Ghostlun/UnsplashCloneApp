//
//  RegisterViewController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/11/21.
//

import FirebaseAuth
import FirebaseFirestore
import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
        
    lazy var viewModel = RegisterViewModel(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func getUserInformation() -> User {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let firstName = firstNameTextField.text,
              let lastName = lastNameTextField.text,
              let userName = userNameTextField.text
        else { fatalError("Failed to get information") }
        
        return User(firstName: firstName, lastName: lastName, userName: userName, email: email, password: password)
    }
    
    @IBAction private func signUpButtonClicked() {
        viewModel.createUser(getUserInformation())
    }
}
