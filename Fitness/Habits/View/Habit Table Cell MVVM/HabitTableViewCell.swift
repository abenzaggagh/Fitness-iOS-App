//
//  HabitTableViewCell.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/1/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    
    let persistance = PersistanceService.shared
    
    var habit: Habit?
    
    var streakCount: Int32?
    var progressCount: Int?

    @IBOutlet weak var habitNameLabel:     UILabel!
    @IBOutlet weak var habitProgressLabel: UILabel!
    @IBOutlet weak var habitCurrentStreak: UILabel!
    
    @IBOutlet weak var habitProgressView:  UIProgressView!
    
    @IBOutlet weak var markGoalCompleted: HabitMarkCompletedButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        habitProgressView.layer.cornerRadius = 2.0
        // TODO: Make the
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureHabitLabel()
        configureProgressView()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func markCompleted(_ sender: Any) {
        // Make all variables reactive
        
        if let habit = habit {
            
            habit.markCompleted()
            
            progressCount = (progressCount ?? 0) + 1
            
            if (habit.goalFrequency) == Int32(habit.currentGoal()) {
                markGoalCompleted.isCompleted()
            }
            
        }
        // TODO: Move the methods in charge of the streak outside of the controller
        
        configureHabitLabel()
        configureProgressView()
        
        persistance.save()
        
    }
    
    func configureProgressView() {
        if let habit = habit {
            let currentProgress = Float(progressCount ?? 0) / Float(habit.goalFrequency)
            habitProgressView.setProgress(currentProgress, animated: true)
            if currentProgress < 1 {
                markGoalCompleted.isNotCompleted()
            } else {
                markGoalCompleted.isCompleted()
            }
        }
    }
    
    func configureHabitLabel() {
        if let habit = habit {
            
            switch habit.goalPeriod! {
            case "Daily":
                habitCurrentStreak.text = "\(streakCount ?? 0) Day Streak"
                habitProgressLabel.text = "\(progressCount ?? 0) of \(habit.goalFrequency) completed for today!"
            case "Weekly":
                habitProgressLabel.text = "\(progressCount ?? 0) of \(habit.goalFrequency) completed for the week!"
                habitCurrentStreak.text = "\(streakCount ?? 0) Week Streak"
            case "Monthly":
                habitProgressLabel.text = "\(progressCount ?? 0) of \(habit.goalFrequency) completed for the month!"
                habitCurrentStreak.text = "\(streakCount ?? 0) Month Streak"
            case "Yearly":
                habitProgressLabel.text = "\(progressCount ?? 0) of \(habit.goalFrequency) completed for the year!"
                habitCurrentStreak.text = "\(streakCount ?? 0) Streak"
            default:
                break
            }
        }
    }
    
}
