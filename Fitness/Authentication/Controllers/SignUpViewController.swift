//
//  SignUpViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/3/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.tintColor = UIColor.lightGray
            emailTextField.setIcon(UIImage(named: "Email")!)
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.tintColor = UIColor.lightGray
            passwordTextField.setIcon(UIImage(named: "Password")!)
        }
    }
    @IBOutlet weak var confirmPassword: UITextField! {
        didSet {
            confirmPassword.tintColor = UIColor.lightGray
            confirmPassword.setIcon(UIImage(named: "Password")!)
        }
    }
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBOutlet weak var continueWithFacebook: UIButton!
    @IBOutlet weak var continueWithTwitter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAccountButton.layer.cornerRadius = 12
        continueWithTwitter.layer.cornerRadius = 12
        continueWithFacebook.layer.cornerRadius = 12
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        
    }
    
}
