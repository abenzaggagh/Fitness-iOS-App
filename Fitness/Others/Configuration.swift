//
//  Configuration.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/11/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation

struct API {
    
    let serverPath: String = "http://35.205.77.228"
    
    let authPath:   String = "/api/users/auth/"
    
    static let shared = API()
    
    public var loginPath: String {
        return self.serverPath + self.authPath + "login"
    }
    
    private var signUpPath: String {
        return self.serverPath + self.authPath + "register"
    }
    
}
