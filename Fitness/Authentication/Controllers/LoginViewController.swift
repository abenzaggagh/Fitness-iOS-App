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
    @IBOutlet weak var facebookButton: FALoadingButton!
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.addSubview(errorMessageView)
        self.view.addSubview(loadingView)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let backgroundImage = UIImage.init(named: "Background")
//        let backgroundImageView = UIImageView.init(frame: self.view.frame)
//
//        backgroundImageView.image = backgroundImage
//        backgroundImageView.contentMode = .scaleAspectFill
//        backgroundImageView.alpha = 0.1
//        backgroundImageView.with
//
//        if !UIAccessibility.isReduceTransparencyEnabled {
//            view.backgroundColor = .clear
//
//            let blurEffect = UIBlurEffect(style: .dark)
//            let blurEffectView = UIVisualEffectView(effect: blurEffect)
//
//            blurEffectView.frame = backgroundImageView.bounds
//            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

//            // view.addSubview(blurEffectView)
//
//        } /* else {
//            view.backgroundColor = .black
//        } */

//        self.view.insertSubview(backgroundImageView, at: 0)
        
        loadingView.isHidden = true
        loadingView.layer.cornerRadius = 18
        
        let H = self.view.frame.height * 0.4
        let W = self.view.frame.width * 0.9
        let X = self.view.bounds.midX - (W/2)
        let Y = self.view.bounds.midY - (H/2)
        
        self.errorMessageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.errorMessageView.frame.height)
        
        self.loadingView.isOpaque = false
        self.loadingView.layer.masksToBounds = true
        self.loadingView.frame = CGRect(x:X, y: Y, width: W, height: H)
        self.loadingView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        
        self.view.addSubview(self.loadingView)
        
        loginButton.layer.cornerRadius = 12
        twitterButton.layer.cornerRadius = 12
        facebookButton.layer.cornerRadius = 12
        
//        facebookButton.setImage(UIImage(named: "Facebook"), for: .normal)
//        twitterButton.setImage(UIImage(named: "Twitter"), for: .normal)
        
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
        
        /// TODO: Move the Configuration Parameters outside of here
        let loginPath = API.shared.loginPath
        
        if let email = emailTextField.text, !email.isEmpty {
            if let password = passwordTextField.text, password.count > 7 {
                
                DispatchQueue.main.async {
                    self.loadingView.isHidden = false
                }
                
                let userCredentials = [
                    "email": email,
                    "password": password
                ]
                
                let session = URLSession.shared
                
                let url = URL(string: loginPath)!
                
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
                                        
                                        self.loadingView.isHidden = true
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
    
    /* @IBInspectable */ var isLoading = false
    
    @IBAction func loginWithFacebook(_ sender: UIButton) {
        if let sender = sender as? FALoadingButton {
            
            if self.isLoading {

                sender.isLoading = false
                self.isLoading = false
            } else {
                sender.isLoading = true
                self.isLoading = false
            }
            
            let _ = Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { timer in
                self.isLoading = false
            }
            
            
        }
    }
    
    
    
    @IBAction func loginWithTwitter(_ sender: UIButton) {
        facebookButton.isLoading = false
    }
    
}
