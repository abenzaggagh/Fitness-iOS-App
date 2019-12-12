//
//  SceneDelegate.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/9/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

import FBSDKCoreKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var isLogin: Bool?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        self.isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        if isLogin != nil, isLogin == true {
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "Main")
            
            window?.rootViewController = initialViewController
            
        } else {
            
            let authenticationStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
            
            let isSeen = UserDefaults.standard.bool(forKey: "isSeen")
            
            let initialViewController: UIViewController
            
            if isSeen == true {
               initialViewController = authenticationStoryboard.instantiateViewController(withIdentifier: "Login")
               window?.rootViewController = initialViewController
            } else {
                initialViewController = authenticationStoryboard.instantiateViewController(withIdentifier: "Authentication")
                window?.rootViewController = initialViewController
            }
            
        }
        
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        PersistanceService.shared.save()
    }

}

