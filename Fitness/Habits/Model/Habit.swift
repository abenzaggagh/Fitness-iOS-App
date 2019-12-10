//
//  Habit.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/25/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation

enum HabitError: Error {
    
}

enum Type: Int, Codable {
    
    case build = 0, quit
    
    var description: String {
        switch self {
        case .build:
            return "Build"
        case .quit:
            return "Quit"
        }
    }
    
}

enum GoalPeriod: Int, Codable {
    
    case daily = 0, weekly, monthly, yearly
    
    var description: String {
        switch self {
        case .daily:
            return "Daily"
        case .weekly:
            return "Weekly"
        case .monthly:
            return "Monthly"
        case .yearly:
            return "Yearly"
        }
    }
    
}

struct DailyDays: Codable {
    
    private var monday: Bool?
    private var tuesday : Bool?
    private var wednesday: Bool?
    private var thursday: Bool?
    private var friday: Bool?
    private var saturday: Bool?
    private var sunday: Bool?
    
    mutating func on(day dayName: String, is bool: Bool) {
        switch dayName {
        case "Mon":
            self.monday = bool
        case "Tue":
            self.tuesday = bool
        case "Wed":
            self.wednesday = bool
        case "Thur":
            self.thursday = bool
        case "Fir":
            self.friday = bool
        case "Sat":
            self.saturday = bool
        case "Sun":
            self.sunday = bool
        default:
            break
        }
    }
 
}

struct Goal: Codable {
    
    private var goalPeriod: GoalPeriod?
    private var goalFrequency : Int = 1
    
    private var trackingDays: DailyDays?
    
    init(period goalPeriod: GoalPeriod) {
        self.goalPeriod = goalPeriod
    }
    
    init(period goalPeriod: GoalPeriod, frequency goalFrequency: Int) {
        self.goalPeriod = goalPeriod
        self.goalFrequency = goalFrequency
    }
    
    init(period goalPeriod: GoalPeriod, frequency goalFrequency: Int, on days: DailyDays) {
        self.goalPeriod = goalPeriod
        self.goalFrequency = goalFrequency
        self.trackingDays = days
    }
    
    mutating func setTracking(days: DailyDays) {
        self.trackingDays = days
    }
    
    public func getGoalPeriod() -> GoalPeriod {
        return goalPeriod!
    }
    
}


extension Habit {
    
}
