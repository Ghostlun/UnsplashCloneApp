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
    
    lazy var user = User(firstName: "", lastName: "", userName: "", email: "", password: "")
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func getUserInformation() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let firstName = firstNameTextField.text,
              let lastName = lastNameTextField.text,
              let userName = userNameTextField.text
            else { return }
        user = User(firstName: firstName, lastName: lastName, userName: userName, email: email, password: password)
    }
    
    @IBAction private func signUpButtonClicked() {
        getUserInformation()
        createUser()
        addDataIntoFirebaseStore()
    }
    
    private func createUser() {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { _, error in
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .operationNotAllowed:
                    self.showAlert(title: "Your register is not allowed", message: "please check network", buttons: [.ok]) { _, _ in }
                    
                case .emailAlreadyInUse:
                    self.showAlert(title: "Email already used", message: "please type different network", buttons: [.ok]) { _, _ in }
                    
                case .invalidEmail:
                    self.showAlert(title: "Email address is badly formatted", message: "please check your email types", buttons: [.ok]) { _, _ in }
                    
                case .weakPassword:
                    self.showAlert(title: "Weak pasword", message: "please use strong pasword", buttons: [.ok]) { _, _ in }
                    
                default:
                    print("Error: \(error.localizedDescription)")
                }
            } else {
                print("User signs up successfully")
            }
        }
    }
    
    private func addDataIntoFirebaseStore() {
        let data = ["email": user.email, "firstName": user.firstName, "lastName": user.lastName, "password": user.password, "userName": user.userName]
        db.collection("users").document(user.userName).setData(data, merge: true)
        print("Create page")
    }
    
    private func isValidEmail(_ email: String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
       return emailPred.evaluate(with: email)
     }
     
     private func isValidPassword(_ password: String) -> Bool {
       let minPasswordLength = 6
       return password.count >= minPasswordLength
     }
}

extension RegisterViewController: AlertProtocol {
}
