//
//  User.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/1/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation

enum Gender: String, Codable {
    
    case Male = "Male", Female = "Female", Other = "Other"
    
    var descrption: String {
        switch self {
        case .Male:
            return "Male"
        case .Female:
            return "Female"
        case .Other:
            return "Other"
        }
    }
    
}

struct User: Codable {

    var userID: UInt?
    var firstName: String?
    var lastName: String?
    var gender: Gender?
    var birthday: Date?
    var height: UInt8?
    var weight: UInt8?
    var email: String?
    var phone: String?
    
    init(firstName: String, lastName: String, gender: Gender, birthday: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.birthday = birthday
    }
    
    init() {
        firstName = UserDefaults.standard.string(forKey: "firstName") ?? nil
        lastName = UserDefaults.standard.string(forKey: "lastName") ?? nil
        gender = nil
        birthday = nil
    }
    
}
