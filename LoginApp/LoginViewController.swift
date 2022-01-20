//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Михаил Иванов on 17.01.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    //MARK: IB Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    //User Data
    let userName = "User"
    let userPassword = "12345678"
    
    //MARK: Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        passwordTF.enablesReturnKeyAutomatically = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController
        else { return }
        welcomeVC.welcome = userNameTF.text
    }

    //MARK: IB Actions
    @IBAction func loginButtonPressed() {
        if userNameTF.text != userName || passwordTF.text != userPassword {
        showAlert(title: "Invalid login or password",
                  and: "Please, enter correct name and password")
        } else { return }
    }
    
    @IBAction func forgotNameButtonPressed() {
        showAlert(title: "Oops!", and: "Your name is User")
    }
    
    @IBAction func ForgotPasswordButtonPressed() {
        showAlert(title: "Oops!", and: "Your password is 12345678")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTF.text?.removeAll()
        passwordTF.text?.removeAll()
    }
    
    //MARK: Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTF:
            passwordTF.becomeFirstResponder()
        default:
            loginButtonPressed()
            performSegue(withIdentifier: "First", sender: Any?.self)
        }
        return true
    }
    
    private func showAlert (title: String, and message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default) {
            _ in self.passwordTF.text?.removeAll()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }

}
