//
//  ForgotPasswordViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/4/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.tintColor = UIColor.lightGray
            emailTextField.setIcon(UIImage(named: "Email-Privacy")!)
        }
    }
    
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetPasswordButton.layer.cornerRadius = 12.0
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

    @IBAction func restPassword(_ sender: UIButton) {
         
    }
    
}
