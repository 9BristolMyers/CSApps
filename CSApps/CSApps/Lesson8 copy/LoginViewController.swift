//
//  LoginViewController.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/15/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let authService = Auth.auth()
    
    private var token: AuthStateDidChangeListenerHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        token = authService.addStateDidChangeListener { auth, user in
            guard user != nil else { return }
            self.showHomeVC()
        }

    }
    
    @IBAction func signInAction(_ sender: Any) {
        
        guard let email = emailTextField.text, emailTextField.hasText,
              let password = passwordTextField.text, passwordTextField.hasText
        else {
            showAlert(title: "Error", text: "Логин и/или пароль не введены" )
            return
        }
        
        authService.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.showAlert(title: "Ошибка Firebase", text: error.localizedDescription)
                return
            }
            
            self.showHomeVC()
        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
        guard let email = emailTextField.text, emailTextField.hasText,
              let password = passwordTextField.text, passwordTextField.hasText
        else {
            showAlert(title: "Error", text: "Логин и/или пароль не введены" )
            return
        }
        
        authService.createUsers(withEmail: email, password: password) { authResult, error in
        if let error = error {
            self.showAlert(title: "Ошибка Firebase", text: error.localizedDescription)
            return
        }
            
            signInAction(nil)
        }
    }

        
    private func  showHomeVC() {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") else { return }
        guard let window = self.view.window else { return }
        window.rootViewController = vc
    }
    
    private func showAlert() {
        
        private func showAlert(title: String?, text: String?) {
        
            let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cansel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
    }
}
