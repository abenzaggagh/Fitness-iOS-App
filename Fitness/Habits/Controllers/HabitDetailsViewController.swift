//
//  HabitDetailsViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/26/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit
import CoreData

class HabitDetailsViewController: UIViewController {
    
    var habit: Habit?

    let persistance = PersistanceService.shared

    @IBOutlet weak var navigation: UINavigationItem!
    
    @IBOutlet weak var habitCreationDateLabel: UILabel!
    @IBOutlet weak var habitGoalPeriodLabel: UILabel!
    @IBOutlet weak var habitTypeLabel: UILabel!
    @IBOutlet weak var habitCurrentProgressLabel: UILabel!
    
    func format(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let habit = habit {
            
            navigation.title = "\(habit.name!)"
            
            habitCreationDateLabel.text = "Since \(format(date: habit.startDate!))"
            habitGoalPeriodLabel.text = habit.goalPeriod!
            
            // Retreive Habit's Progress
            let todayProgress = NSFetchRequest<NSFetchRequestResult>(entityName: "Progress")
            todayProgress.predicate = NSPredicate(format: "progressHabit == %@", habit)
            
            do {
                
                let todayProgressResult = try persistance.context.fetch(todayProgress) as? [Progress]
                
                if let todayProgressResult = todayProgressResult {
                    for progress in todayProgressResult {
                        print(progress)
                    }
                }
                
                
            } catch {
                print(error)
            }
            
            
            
            
            // NSOrderedSet
//            if let habitProgress = habit.habitProgress {
//                let habitProgressArray = habitProgress.array as! [Progress]
//                for progress in habitProgressArray {
//                    print(progress.day ?? "No date.")
//                }
//            }
//
//            var calendar = Calendar(identifier: .gregorian)
//            calendar.timeZone = TimeZone(secondsFromGMT: 0)!
//
//            let startDate = calendar.startOfDay(for: Date())
//            print("Start Date: \(startDate.description)")
//            let endDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate)
//            print("End Date: \(endDate!)")
//
//            let todayProgress = NSFetchRequest<NSFetchRequestResult>(entityName: "Progress")
//            todayProgress.predicate = NSPredicate(format: "day >= %@ AND day <= %@", startDate as NSDate, endDate! as NSDate)
//
//            do {
//                let todayProgressResult = try persistance.context.fetch(todayProgress)
//
//                for progress in todayProgressResult {
//                    print("Today Progress: \(progress)")
//                }
//
//            } catch {
//
//            }


            
        }
        
        

    }
    

}
