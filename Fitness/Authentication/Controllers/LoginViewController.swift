//
//  LoginViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/2/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var loadingView: UIView!
    
    @IBOutlet weak var errorLabel: UILabel!
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
        
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
        errorMessageView.isHidden = true
    }

    @IBAction func hideErrorMessage(_ sender: UIButton) {
        errorMessageView.isHidden = true
    }
    
    
    @IBAction func forgetPassword(_ sender: UIButton) {
        errorMessageView.isHidden = true
    }
    
    @IBAction func login(_ sender: Any) {
        
        let serverPath = "http://35.205.77.228"
        let authPath = "/api/users/auth/login"
        
        if let email = emailTextField.text, !email.isEmpty {
            if let password = passwordTextField.text, password.count > 7 {
                
                let userCredentials = [
                    "email": email,
                    "password": password
                ]
                
                let session = URLSession.shared
                
                let url = URL(string: serverPath+authPath)!
                
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("application/json", forHTTPHeaderField: "Accept")
                
                let userCredentialsJSON = try! JSONSerialization.data(withJSONObject: userCredentials, options: [])
                
                DispatchQueue.global(qos: .background).async {
                    
                    let task = session.uploadTask(with: request, from: userCredentialsJSON) { data, response, error in
                        
                        if let data = data {
                            
                            do {
                                
                                let serverResponse =  try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String:Any]

                                if serverResponse != nil, serverResponse?.keys.contains("token") ?? false {
                                    
                                    let token = serverResponse?["token"] as? String
                                    
                                    UserDefaults.standard.set(true, forKey: "isLogin")
                                    UserDefaults.standard.set(token, forKey: "token")
                                    
                                    DispatchQueue.main.async {
                                        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                        guard let initialViewController = mainStoryboard.instantiateInitialViewController() else { return }

                                        initialViewController.modalPresentationStyle = .fullScreen

                                        self.present(initialViewController, animated: true, completion: nil)
                                    }
                                    
                                } else if serverResponse != nil, serverResponse?.keys.contains("message") ?? false {
                                    
                                    DispatchQueue.main.async {
                                        
                                        self.errorMessageView.isHidden = false
                                        
                                        if let message = serverResponse?["message"] as? String {
                                            self.errorLabel.text = message
                                        }
                                    }
                                    
                                }
                                
                            } catch let error as NSError {
                                print(error)
                            }

                        }
                    }

                    task.resume()
                }
                
            } else {
                passwordTextField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 2.0, revert: true)
            }
        } else {
            emailTextField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 2.0, revert: true)
        }
        
    }
    
    @IBAction func loginWithFacebook(_ sender: UIButton) {
        errorMessageView.isHidden = true
        
        UserDefaults.standard.set(true, forKey: "isLogin")

        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let initialViewController = mainStoryboard.instantiateInitialViewController() else { return }

        initialViewController.modalPresentationStyle = .fullScreen

        self.present(initialViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func loginWithTwitter(_ sender: UIButton) {
        errorMessageView.isHidden = true
        
    }
    
}
