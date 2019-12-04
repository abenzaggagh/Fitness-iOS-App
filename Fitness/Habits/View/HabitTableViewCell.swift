//
//  HabitTableViewCell.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/1/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class HabitTableViewCell: UITableViewCell {

    @IBOutlet weak var habitNameLabel: UILabel!
    @IBOutlet weak var habitGoalButton: UIButton!
    @IBOutlet weak var habitProgressView: UIProgressView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func onGoalCompleted(_ sender: UIButton) {
        
    }
    
}
