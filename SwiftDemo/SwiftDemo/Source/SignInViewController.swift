//
//  SignInViewController.swift
//  SwiftDemo
//
//  Created by Easter on 12/20/15.
//  Copyright © 2015 Easter. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passWordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Sign In"
        if let username = AppSettings.sharedInstance.username {
            self.userNameField.text = username
        }
        if let password = AppSettings.sharedInstance.password {
            self.passWordField.text = password
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    @IBAction func signInDidTap(sender: AnyObject) {
        self.signInButton.userInteractionEnabled = false
        self.indicator.startAnimating()
        let username = userNameField.text
        let password = passWordField.text
        if username != nil && password != nil {
            WebService.sharedInstance.signIn(username!, passWord: password!) {success in
                self.signInButton.userInteractionEnabled = true
                self.indicator.stopAnimating()
                if success {
                    MainViewController.sharedInstance.showHomeView()
                }
            }
        }
    }
    
    @IBAction func showPasswordDidTap(sender: AnyObject) {
        self.passWordField.secureTextEntry = !self.passWordField.secureTextEntry
    }
}
