//
//  Progress.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/25/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation


protocol Trackable {
    
    func markDone(on date: Date)
    func markCompleted(on date: Date)
    
}

class HabitProgress: Trackable, Codable {
    
    var progressDate: Date = Date()
    
    
    func markDone(on date: Date) {
        
    }
    
    func markCompleted(on date: Date) {
        
    }
    
}
