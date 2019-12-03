//
//  LoginViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/2/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let user: User? = nil

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 12
        twitterButton.layer.cornerRadius = 12
        facebookButton.layer.cornerRadius = 12
    }

    
    @IBAction func login(_ sender: Any) {
        
        UserDefaults.standard.set(true, forKey: "isLogin")
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let initialViewController = mainStoryboard.instantiateInitialViewController() else { return }
        
        initialViewController.modalPresentationStyle = .fullScreen

        self.present(initialViewController, animated: true, completion: nil)

    }
    
    
}
