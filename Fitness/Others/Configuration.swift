//
//  Configuration.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/11/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation

struct API {
    
    let serverPath: String = "http://localhost/"
    
    let usersPath: String = "api/users"
    
    let authPath:   String = "api/users/auth/"
    
    static let shared = API()
    
    // Route: /api/users/auth/login
    public var loginPath: String {
        return self.serverPath + self.authPath + "login"
    }
    
    // Route: /api/users/auth/sign-up
    public var signUpPath: String {
        return self.serverPath + self.authPath + "sign-up"
    }
    
    // Route: /api/users/auth/verify
    public var verifyExistingPath: String {
        return self.serverPath + self.authPath + "verify"
    }
    
}
