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
    
    @IBOutlet var habitDetailsView: UIView!
    @IBOutlet weak var habitDetailsScrollView: UIScrollView!
    
    @IBOutlet weak var habitCreationDateLabel: UILabel!
    @IBOutlet weak var habitGoalPeriodLabel: UILabel!
    @IBOutlet weak var habitTypeLabel: UILabel!
    @IBOutlet weak var habitCurrentProgressLabel: UILabel!
    @IBOutlet weak var habitGoalFrequencyLabel: UILabel!
    
    @IBOutlet weak var habitCurrentStreak: UILabel!
    @IBOutlet weak var habitLongestStreak: UILabel!
    
    @IBOutlet weak var habitProgressView: HabitProgressView!
    
    func format(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: date)
    }
    
    func setupUI() {
        habitDetailsScrollView.addSubview(habitDetailsView)
        habitDetailsScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        habitDetailsView.topAnchor.constraint(equalTo: habitDetailsScrollView.topAnchor).isActive = true
        habitDetailsView.leadingAnchor.constraint(equalTo: habitDetailsScrollView.leadingAnchor).isActive = true
        habitDetailsView.trailingAnchor.constraint(equalTo: habitDetailsScrollView.trailingAnchor).isActive = true
        habitDetailsView.bottomAnchor.constraint(equalTo: habitDetailsScrollView.bottomAnchor).isActive = true
        
        habitDetailsView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        habitProgressView.layer.cornerRadius = 12.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        
        
        if let habit = habit {
            
            print("IS PREV COMP : \(habit.previousCompleted())")
            
            navigation.title = "\(habit.name!)"
            
            habitGoalPeriodLabel.text = habit.goalPeriod!
            habitGoalFrequencyLabel.text = "of \(habit.goalFrequency) completed."
            habitCreationDateLabel.text = "Since \(format(date: habit.startDate!))"
            
            switch habit.goalPeriod! {
            case "Daily":                
                
                habitLongestStreak.text = "\(habit.longestStreak) days"
                habitCurrentStreak.text = "\(habit.currentStreak) days"
                habitCurrentProgressLabel.text = "\(habit.currentGoal())"
                
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
            
            // Retreive Habit's Progress
            let todayProgress = NSFetchRequest<NSFetchRequestResult>(entityName: "Progress")
            todayProgress.predicate = NSPredicate(format: "progressHabit == %@", habit)
            
            do {
                
                let todayProgressResult = try persistance.context.fetch(todayProgress) as? [Progress]
                
                if let todayProgressResult = todayProgressResult {
//                    for progress in todayProgressResult {
//                        print(progress)
//                    }
                }
                
                
            } catch {
                print(error)
            }
            
                     
        }
        
        

    }
    
    
    
    @IBAction func markComplete(_ sender: UIButton) {
        if let habit = habit {
            habit.markCompleted()
            
            
            habitCurrentProgressLabel.text = "\(habit.currentGoal())"
        }
    }
    
    @IBAction func undoComplete(_ sender: UIButton) {
        if let habit = habit {
            habit.undoCompleted()
            habitCurrentProgressLabel.text = "\(habit.currentGoal())"
        }
    }
    
}
