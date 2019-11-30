//
//  Habit.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/25/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation

enum DayError: Error {
    
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
    
    func habitType() -> String {
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


public class Habit: Codable {
    
    var name: String?
    var type: Type?
    var goal: Goal?
    
    var reminder = [HabitReminder]()
    var progress = [HabitProgress]()
    
    var createdAt: Date?
    
    public var note: String?
    
    
    init(name: String, type: Type, goal: Goal, note: String) {
        self.name = name
        self.type = type
        self.goal = goal
        self.note = note
    }
    
    init(isNew: Bool) {
        self.name = nil
        self.type = nil
        self.goal = nil
        self.createdAt = isNew ? Date() : nil
    }
    
    func addNewProgress() {
        // let progress = HabitProgress()
        switch goal?.getGoalPeriod() {
        case .daily:
            break
        case .weekly:
            break
        case .monthly:
            break
        case .yearly:
            break
        case .none:
            break
        }
    }
    
    func addProgress(with progress: HabitProgress) {
        self.progress.append(progress)
    }
    
}

