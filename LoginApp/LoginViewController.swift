//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Михаил Иванов on 17.01.2022.
//

import UIKit

class LoginViewController: UIViewController {

 
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    var welcome: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController
        else { return }
        welcomeVC.welcome = userNameTF.text
    }

    @IBAction func loginButtonPressed() {
    }
    
    @IBAction func forgotNameButtonPressed() {
        showAlert(title: "Oops!", and: "Your name is User")
    }
    
    @IBAction func ForgotPasswordButtonPressed() {
        showAlert(title: "Oops!", and: "Your password is 12345678")
    }
    
    private func showAlert (title: String, and message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

