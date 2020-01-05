//
//  Habit.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/25/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import CoreData
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

protocol Trackable {
    
//    func currentStreak() -> Int
//    func longestStreak() -> Int
    func undoCompleted()
    func markCompleted()
}

let persistance = PersistanceService.shared

extension Habit: Trackable {
        
    // TODO: Calculate the Longest Streak
    // TODO: Calculate the Current Streak and not only count the # of Progress
    
    func previousCompleted() -> Bool {
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        switch self.goalPeriod! {
        case "Daily":
            
            let startDate = Date.yesterday
            let endDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate)
            
            let yesterdayProgress = NSFetchRequest<NSFetchRequestResult>(entityName: "Progress")
            yesterdayProgress.predicate = NSPredicate(format: "progressHabit == %@ AND day >= %@ AND day <= %@", self, startDate as NSDate, endDate! as NSDate)
            
            do {
                
                let yesterdayProgressResult = try persistance.context.fetch(yesterdayProgress) as? [Progress]
                
                if let yesterdayProgressResult = yesterdayProgressResult {
                    if yesterdayProgressResult.count >= self.goalFrequency {
                        return true
                    } else {
                        return false
                    }
                }
                
            } catch {
                print(error)
            }
            
        case "Weekly":
            
            return false
        case "Monthly":
            
            return false
        case "Yearly":
            
            return false
        default:
            return false
        }
        
        return false
        
    }
    
    func currentGoal() -> Int {
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        switch self.goalPeriod! {
        case "Daily":
            
            let startDate = calendar.startOfDay(for: Date())
            let endDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate)

            let todayProgress = NSFetchRequest<NSFetchRequestResult>(entityName: "Progress")
            todayProgress.predicate = NSPredicate(format: "progressHabit == %@ AND day >= %@ AND day <= %@", self, startDate as NSDate, endDate! as NSDate)
            
            do {
                
                let todayProgressResult = try persistance.context.fetch(todayProgress) as? [Progress]
                if let todayProgressResult = todayProgressResult {
                    return todayProgressResult.count
                }
                
            } catch {
                print(error)
            }
            
            break
        case "Weekly":
            
            return 0
        case "Monthly":
            
            return 0
        case "Yearly":
            
            return 0
        default:
            return 0
        }
        
        return 0
    }
    
    func currentProgress() -> [Progress]? {
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        if let goalPeriod = self.goalPeriod {
            if goalPeriod == "Daily" {
                
                let startDate = calendar.startOfDay(for: Date())
                let endDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate)

                let todayProgress = NSFetchRequest<NSFetchRequestResult>(entityName: "Progress")
                todayProgress.predicate = NSPredicate(format: "progressHabit == %@ AND day >= %@ AND day <= %@", self, startDate as NSDate, endDate! as NSDate)
                let todayProgressSort = NSSortDescriptor.init(key: "day", ascending: true)
                todayProgress.sortDescriptors = [todayProgressSort]
                
                do {
                    
                    let todayProgressResult = try persistance.context.fetch(todayProgress) as? [Progress]
                    
                    if let todayProgressResult = todayProgressResult {
                        return todayProgressResult
                    }
                    
                } catch {
                    print(error)
                }
                
            } else if goalPeriod == "Weekly" {
                return nil
            } else if goalPeriod == "Monthly" {
                return nil
            } else if goalPeriod == "Yearly" {
                return nil
            }
        }
        
        
        return nil
    }
    
    
    func undoCompleted() {
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        switch self.goalPeriod! {
        case "Daily":
            
            let startDate = calendar.startOfDay(for: Date())
            let endDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate)

            let todayProgress = NSFetchRequest<NSFetchRequestResult>(entityName: "Progress")
            todayProgress.predicate = NSPredicate(format: "progressHabit == %@ AND day >= %@ AND day <= %@", self, startDate as NSDate, endDate! as NSDate)
            let todayProgressSort = NSSortDescriptor.init(key: "day", ascending: true)
            todayProgress.sortDescriptors = [todayProgressSort]
            
            do {
                
                let todayProgressResult = try persistance.context.fetch(todayProgress) as? [Progress]
                
                if let lastProgress = todayProgressResult?.last {
                    self.removeFromHabitProgress(lastProgress)
                }
                
                
            } catch {
                print(error)
            }
            
            break
        case "Weekly":
            
            break
        case "Monthly":
            
            break
        case "Yearly":
            
            break
        default:
            break
        }
        
        persistance.save()
        
    }
    
    func markCompleted() {
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        let progress = Progress(entity: Progress.entity(), insertInto: persistance.context)
        progress.day = Date()
        
        switch self.goalPeriod! {
        case "Daily":
            
            let startDate = calendar.startOfDay(for: Date())
            let endDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate)

            let todayProgress = NSFetchRequest<NSFetchRequestResult>(entityName: "Progress")
            todayProgress.predicate = NSPredicate(format: "progressHabit == %@ AND day >= %@ AND day <= %@", self, startDate as NSDate, endDate! as NSDate)
            
            do {
                
                let todayProgressResult = try persistance.context.fetch(todayProgress) as? [Progress]
                
                // TODO Change this code to support Streak count corretly
                if let todayProgressResult = todayProgressResult {
                    
                    if todayProgressResult.count+1 < self.goalFrequency {
                        self.addToHabitProgress(progress)
                    } else {
                        self.addToHabitProgress(progress)
                        
                        if self.previousCompleted() {
                            self.currentStreak = self.currentStreak + 1
                            if self.longestStreak <= self.currentStreak {
                                self.longestStreak = self.currentStreak
                            }
                        } else {
                            self.currentStreak = 1
                            if self.longestStreak == 0 {
                                self.longestStreak = 1
                            }
                            // Check and init the longest streak
                        }
                        
                    }
                
                    persistance.save()
                }
                
            } catch {
                print(error)
            }
            
        case "Weekly":
            
            break
        case "Monthly":
            
            break
        case "Yearly":
            
            break
        default:
            break
        }
        
        persistance.save()
        
    }
    
}
