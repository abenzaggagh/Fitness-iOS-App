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
    
    @IBOutlet var loadingView: UIView!
    
    @IBOutlet weak var errorMessageView: UIView! {
        didSet {
            errorMessageView.setShadowView()
        }
    }
    
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.tintColor = UIColor.lightGray
            emailTextField.setIcon(UIImage(named: "Username")!)
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.tintColor = UIColor.lightGray
            passwordTextField.setIcon(UIImage(named: "Password")!)
        }
    }
    
    @IBOutlet weak var forgetPasswordButton: UIButton! {
        didSet {
            forgetPasswordButton.tintColor = UIColor.lightGray
        }
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.addSubview(errorMessageView)
        self.view.addSubview(loadingView)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView.isHidden = true
        loginButton.layer.cornerRadius = 12
        twitterButton.layer.cornerRadius = 12
        facebookButton.layer.cornerRadius = 12
    }

    @IBAction func hideErrorMessage(_ sender: UIButton) {
        errorMessageView.isHidden = true
    }
    
    
    @IBAction func forgetPassword(_ sender: UIButton) {
        errorMessageView.isHidden = true
    }
    
    @IBAction func login(_ sender: Any) {
        
//        UserDefaults.standard.set(true, forKey: "isLogin")
//
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let initialViewController = mainStoryboard.instantiateInitialViewController() else { return }
//
//        initialViewController.modalPresentationStyle = .fullScreen
//
//        self.present(initialViewController, animated: true, completion: nil)

        errorMessageView.isHidden = false
        
    }
    
    @IBAction func loginWithFacebook(_ sender: UIButton) {
        errorMessageView.isHidden = true
        
    }
    
    @IBAction func loginWithTwitter(_ sender: UIButton) {
        errorMessageView.isHidden = true
        
    }
    
}
