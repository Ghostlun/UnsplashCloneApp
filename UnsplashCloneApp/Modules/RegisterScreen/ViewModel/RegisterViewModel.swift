//
//  RegisterViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/12/21.
//
import FirebaseAuth
import FirebaseFirestore
import UIKit

class RegisterViewModel {
    
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    let db = Firestore.firestore()

    func createUser(_ user: User) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { _, error in
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .operationNotAllowed:
                    self.viewController.showAlert(title: "Your register is not allowed", message: "please check network", buttons: [.ok]) { _, _ in }
                    
                case .emailAlreadyInUse:
                    self.viewController.showAlert(title: "Email already used", message: "please type different email", buttons: [.ok]) { _, _ in }
                    
                case .invalidEmail:
                    self.viewController.showAlert(title: "Email address is badly formatted", message: "please check your email types", buttons: [.ok]) { _, _ in }
                    
                case .weakPassword:
                    self.viewController.showAlert(title: "Weak pasword", message: "please use strong pasword", buttons: [.ok]) { _, _ in }
                    
                default:
                    print("Error: \(error.localizedDescription)")
                }
            } else {
                self.viewController.dismiss(animated: true, completion: nil)
                print("User signs up successfully")
                let data = ["email": user.email, "firstName": user.firstName, "lastName": user.lastName, "password": user.password, "userName": user.userName]
                self.db.collection("users").addDocument(data: data)
                self.viewController.showAlert(title: "You successfully signed up", message: "Welcome Unsplash App", buttons: [.ok]) { _, _ in }
                print("Create page")
                self.openTheProfilePage()
            }
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
       return emailPred.evaluate(with: email)
     }
    
    private func openTheProfilePage() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let profileController = storyboard.instantiateViewController(identifier: "MyProfileController") as? MyProfileController {
            self.viewController.present(profileController, animated: true, completion: nil)
        }
    }
     
     private func isValidPassword(_ password: String) -> Bool {
       let minPasswordLength = 6
       return password.count >= minPasswordLength
     }
}

extension UIViewController: AlertProtocol {}
