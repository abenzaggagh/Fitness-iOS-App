//
//  Progress.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/25/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation


//protocol Trackable {
//
//
//
//}
//
//protocol Progressable {
//
//
//}

protocol HabitProgress: Codable {
    
    var progressDate: Date { get }
    
    init(on date: Date)
    
    func markDone(on date: Date)
    func markCompleted(on date: Date)
    
}

class DailyProgress: HabitProgress {
    
    
    required init(on date: Date) {
        progressDate = date
    }
    
    
    var progressDate: Date
    
    var goalCompleted: Int?
//    var goalLeft: Int? {
//        get {
//            return
//        }
//    }
    
    func markDone(on date: Date) {
         print()
    }

    func markCompleted(on date: Date) {
        print()
    }
    
}

class WeeklyProgress: HabitProgress {
    
    var progressDate: Date
    
    required init(on date: Date) {
        progressDate = date
    }
    
    func markDone(on date: Date) {
    }
    
    func markCompleted(on date: Date) {
    }
    
    
}

class MonthlyProgress: HabitProgress {
    
    var progressDate: Date
    
    required init(on date: Date) {
        progressDate = date
    }
    
    func markDone(on date: Date) {
    }
    
    func markCompleted(on date: Date) {
    }
    
    
}

class YearlyProgress: HabitProgress {
    
    var progressDate: Date
    
    required init(on date: Date) {
        progressDate = date
    }
    
    func markDone(on date: Date) {
    }
    
    func markCompleted(on date: Date) {
    }
    
}
