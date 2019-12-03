//
//  ProfileViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/2/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
//    @IBAction func logout(_ sender: Any) {
//

//
//    }
    @IBAction func logout(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "isLogin")

        let authenticationStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
        guard let initialViewController = authenticationStoryboard.instantiateInitialViewController() else { return }
        
        initialViewController.modalPresentationStyle = .fullScreen

        self.present(initialViewController, animated: true, completion: nil)
    }
    
}
