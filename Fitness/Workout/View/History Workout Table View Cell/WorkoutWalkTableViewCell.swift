//
//  WorkoutWalkTableViewCell.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 1/7/20.
//  Copyright © 2020 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class WorkoutWalkTableViewCell: UITableViewCell {
    
    var walk: Walk?

    @IBOutlet weak var walkDistanceLabel: UILabel!
    @IBOutlet weak var walkStepsLabel: UILabel!
    @IBOutlet weak var walkDurationLabel: UILabel!
    
    @IBOutlet weak var walkDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureWalkLabel()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.configureWalkLabel()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWalkLabel() {
        
        let format = DateFormatter()
        format.timeZone = .current
        format.dateFormat = "MM/dd/yyyy"
        
        if let walk = walk {
            walkStepsLabel.text = "\(Int32(walk.steps)) Steps"
//            walkDurationLabel.text = "\(Int32(walk.d))"
            walkDistanceLabel.text = "\(Int(walk.distance)) Meters"
            if let date = walk.endDate {
                walkDateLabel.text = "\(format.string(from: date))"
            } else {
                walkDateLabel.text = "--/--/----"
            }
            
            if walk.durationHours == Int16(0) {
                walkDurationLabel.text = String(format: "%.2d:%.2d", walk.durationMinutes, walk.durationSeconds)
            } else {
                walkDurationLabel.text = String(format: "%.2d:%.2d:%.2d", walk.durationHours, walk.durationMinutes, walk.durationSeconds)
            }
            
        }
    }
    
}
