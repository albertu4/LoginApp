//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Михаил Иванов on 17.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeUserText: UILabel!
    
    var welcome: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let userName = welcome else { return }
        welcomeUserText.text = "Welcome, \(userName)!"
    }
}
