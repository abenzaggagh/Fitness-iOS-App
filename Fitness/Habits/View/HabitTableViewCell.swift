//
//  HabitTableViewCell.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/1/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    
    var habit: Habit?

    @IBOutlet weak var habitNameLabel: UILabel!
    @IBOutlet weak var habitProgressLabel: UILabel!
        
    @IBOutlet weak var habitGoalPeriodLabel: UILabel!
    @IBOutlet weak var habitProgressView: UIProgressView!
    
    @IBOutlet weak var checkinGoal: FAButton!
    @IBOutlet weak var markGoalCompleted: FAButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        checkinGoal.layer.cornerRadius = 12.0
        markGoalCompleted.layer.cornerRadius = 12.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(name habitName: String, progress habitProgress: Double) {
        
    }
    
    @IBAction func markCompleted(_ sender: Any) {
        print("Marking Habit As Completed For Today")
    }
}
