//
//  SleepViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 1/7/20.
//  Copyright © 2020 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit
import UserNotifications

class SleepViewController: UIViewController {
 
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
        
        
        
    }
    
}
