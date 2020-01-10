//
//  ProfileViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/2/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    @IBOutlet weak var profileUserFullNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePictureImageView?.layer.cornerRadius = 15.0
        
        profilePictureImageView?.layer.borderWidth = 3.0
        profilePictureImageView?.layer.borderColor = UIColor.white.cgColor
        profilePictureImageView?.clipsToBounds = true
    }
    

    @IBAction func logout(_ sender: UIButton) {
        
        UserDefaults.standard.set(false, forKey: "isLogin")

        let authenticationStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
        guard let initialViewController = authenticationStoryboard.instantiateInitialViewController() else { return }
        
        initialViewController.modalPresentationStyle = .fullScreen

        self.present(initialViewController, animated: true, completion: nil)
        
    }
    
}
