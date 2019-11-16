//
//  Habits.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/12/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation



public class Habit {
    
    public enum HabitType {
        case Build
        case Quit
    }
    
    public enum HabitFrequency {
        case everyDay
        case everyWeekdays
        case everyWeekend
        case everyMonth
        case everyYear
    }
    
    var name: String
    var type: HabitType
    var frequency: HabitFrequency
    var count: Int
    
    var startingDate: Date?
    var endingDate: Date?
    
    init(name: String, type: HabitType, frequency: HabitFrequency, count: Int) {
        self.name = name
        self.type = type
        self.frequency = frequency
        self.count = count
    }
    
    
    
}
